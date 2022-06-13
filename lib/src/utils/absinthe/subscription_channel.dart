// Dart imports:
import 'dart:async';

// Package imports:
import 'package:archethic_lib_dart/src/utils/absinthe/phoenix_link.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:phoenix_socket/phoenix_socket.dart';

class SubscriptionChannel {
  PhoenixSocket? socket;
  PhoenixChannel? channel;
  GraphQLClient? client;

  final StreamController<Map> _onMessageController = StreamController<Map>();
  Stream<Map> get onMessage => _onMessageController.stream;

  Future<void> connect(
      String phoenixHttpLinkEndpoint, String websocketUriEndpoint) async {
    final HttpLink phoenixHttpLink = HttpLink(
      phoenixHttpLinkEndpoint,
    );

    channel =
        await PhoenixLink.createChannel(websocketUri: websocketUriEndpoint);
    final PhoenixLink phoenixLink = PhoenixLink(
      channel: channel!,
    );

    final Link link = Link.split((Request request) => request.isSubscription,
        phoenixLink, phoenixHttpLink);
    client = GraphQLClient(
      link: link,
      cache: GraphQLCache(),
    );
  }

  void addSubscriptionTransactionConfirmed(
      String address, Function(QueryResult) function) {
    final subscriptionDocument = gql(
      'subscription { transactionConfirmed(address: "$address") { nbConfirmations } }',
    );

    final Stream<QueryResult> subscription = client!.subscribe(
      SubscriptionOptions(document: subscriptionDocument),
    );
    subscription.listen(function);
  }

  Future<Message> onPushReply(Push push) async {
    final Completer<Message> completer = Completer<Message>();
    final Message result = await channel!.onPushReply(push.replyEvent);
    completer.complete(result);
    return completer.future;
  }

  void close() {
    _onMessageController.close();
    if (socket != null) {
      socket!.close();
    }
  }
}
