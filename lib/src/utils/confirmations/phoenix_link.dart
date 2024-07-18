import 'dart:async';
import 'dart:developer';

import 'package:graphql/client.dart';
import 'package:phoenix_socket/phoenix_socket.dart';

/// a link for subscriptions (or also mutations/queries) over phoenix channels
class PhoenixLink extends Link {
  /// create a new [PhoenixLink] using an established PhoenixChannel [channel].
  /// You can use the static [createChannel] method to create a [PhoenixChannel]
  /// from a websocket URI and optional parameters (e.g. for authentication)
  PhoenixLink({
    required this.socket,
    required this.channel,
    ResponseParser parser = const ResponseParser(),
    RequestSerializer serializer = const RequestSerializer(),
  })  : _serializer = serializer,
        _parser = parser;

  final PhoenixSocket socket;

  /// the underlying phoenix channel
  final PhoenixChannel channel;

  final RequestSerializer _serializer;
  final ResponseParser _parser;

  /// create a new phoenix socket from the given websocketUri,
  /// connect to it, and create a channel, and join it
  static Future<PhoenixLink> fromWebsocketUri({
    required String uri,
    Map<String, String>? params,
  }) async {
    final socket = PhoenixSocket(
      uri,
      socketOptions: PhoenixSocketOptions(params: params),
    );
    await socket.connect();

    final channel = socket.addChannel(topic: '__absinthe__:control');
    final push = channel.join();
    await push.future;

    return PhoenixLink(socket: socket, channel: channel);
  }

  @override
  Future<void> dispose() {
    channel.close();
    socket.close();
    return super.dispose();
  }

  @override
  Stream<Response> request(Request request, [NextLink? forward]) async* {
    final payload = _serializer.serializeRequest(request);
    String? phoenixSubscriptionId;
    StreamSubscription<Response>? websocketSubscription;

    StreamController<Response>? streamController;
    final push = channel.push('doc', payload);
    try {
      final pushResponse = await push.future;
      //set the subscription id in order to cancel the subscription later
      phoenixSubscriptionId =
          pushResponse.response['subscriptionId'] as String?;

      if (phoenixSubscriptionId != null) {
        //yield all messages for this subscription
        streamController = StreamController();

        websocketSubscription = channel.socket
            .streamForTopic(phoenixSubscriptionId)
            .map(
              (event) => _parser.parseResponse(
                event.payload!['result'] as Map<String, dynamic>,
              ),
            )
            .listen(streamController.add, onError: streamController.addError);
        yield* streamController.stream;
      } else if (pushResponse.isOk) {
        yield _parser
            .parseResponse(pushResponse.response as Map<String, dynamic>);
      } else if (pushResponse.isError) {
        // ignore: only_throw_errors
        throw _parser.parseError(pushResponse.response as Map<String, dynamic>);
      }
    } catch (e, stackTrace) {
      log(e.toString(), error: e, stackTrace: stackTrace);
    } finally {
      await websocketSubscription?.cancel();
      await streamController?.close();
      //this will be called once the caller stops listening to the stream
      // (yield* stops if there is no one listening)
      if (channel.state == PhoenixChannelState.joined &&
          phoenixSubscriptionId != null) {
        channel.push('unsubscribe', {'subscriptionId': phoenixSubscriptionId});
      }
    }
  }
}
