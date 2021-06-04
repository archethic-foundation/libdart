// @dart=2.9

library absinthe_socket;

import 'package:phoenix_wings/phoenix_wings.dart';

/// An Absinthe Socket
class AbsintheSocket {

  AbsintheSocket(this.endpoint, {this.socketOptions}) {
    socketOptions ??= AbsintheSocketOptions();
    subscriptionHandler = NotifierPushHandler(
        onError: _onError,
        onTimeout: _onTimeout,
        onSucceed: _onSubscriptionSucceed);
    unsubscriptionHandler = NotifierPushHandler(
        onError: _onError,
        onTimeout: _onTimeout,
        onSucceed: _onUnsubscriptionSucceed);
    _phoenixSocket = PhoenixSocket(endpoint,
        socketOptions: PhoenixSocketOptions(
            params: socketOptions.params..addAll({'vsn': '2.0.0'})));
    _connect();
  }
  
  String endpoint;
  AbsintheSocketOptions socketOptions = AbsintheSocketOptions();
  PhoenixSocket _phoenixSocket;
  PhoenixChannel _absintheChannel;
  final List<Notifier> _notifiers = [];
  List<Notifier> _queuedPushes = [];
  NotifierPushHandler subscriptionHandler;
  NotifierPushHandler unsubscriptionHandler;

  static void _onError(Map response) {
    print('onError');
    print(response.toString());
  }

  static _onSubscriptionSucceed(Notifier notifier) {
    return (Map response) {
      print('response');
      print(response.toString());
      notifier.subscriptionId = response['subscriptionId'];
    };
  }

  _onUnsubscriptionSucceed(Notifier notifier) {
    return (Map response) {
      print('unsubscription response');
      print(response.toString());
      notifier.cancel();
      _notifiers.remove(notifier);
    };
  }

  static void _onTimeout(Map response) {
    print('onTimeout');
  }

  Future<void> _connect() async {
    await _phoenixSocket.connect();
    _phoenixSocket.onMessage(_onMessage);
    _absintheChannel = _phoenixSocket.channel('__absinthe__:control', {});
    _absintheChannel.join().receive('ok', _sendQueuedPushes);
  }

  void disconnect() {
    _phoenixSocket.disconnect();
  }

  void _sendQueuedPushes(_) {
    _queuedPushes.forEach((notifier) {
      _pushRequest(notifier);
    });
    _queuedPushes = [];
  }

  void cancel(Notifier notifier) {
    unsubscribe(notifier);
  }

  void unsubscribe(Notifier notifier) {
    _handlePush(
        _absintheChannel.push(
            event: 'unsubscribe',
            payload: {'subscriptionId': notifier.subscriptionId}),
        _createPushHandler(unsubscriptionHandler, notifier));
  }

  Notifier send(GqlRequest request) {
    final Notifier notifier = Notifier(request: request);
    _notifiers.add(notifier);
    _pushRequest(notifier);
    return notifier;
  }

  void _onMessage(PhoenixMessage message) {
    final String subscriptionId = message.topic;
    _notifiers
        .where((Notifier notifier) => notifier.subscriptionId == subscriptionId)
        .forEach(
            (Notifier notifier) => notifier.notify(message.payload['result']));
  }

  void _pushRequest(Notifier notifier) {
    if (_absintheChannel == null) {
      _queuedPushes.add(notifier);
    } else {
      _handlePush(
          _absintheChannel.push(
              event: 'doc', payload: {'query': notifier.request.operation}),
          _createPushHandler(subscriptionHandler, notifier));
    }
  }

  void _handlePush(PhoenixPush push, PushHandler handler) {
    push
        .receive('ok', handler.onSucceed)
        .receive('error', handler.onError)
        .receive('timeout', handler.onTimeout);
  }

  PushHandler _createPushHandler(
      NotifierPushHandler notifierPushHandler, Notifier notifier) {
    return _createEventHandler(notifier, notifierPushHandler);
  }

  _createEventHandler(
      Notifier notifier, NotifierPushHandler notifierPushHandler) {
    return PushHandler(
        onError: notifierPushHandler.onError,
        onSucceed: notifierPushHandler.onSucceed(notifier),
        onTimeout: notifierPushHandler.onTimeout);
  }
}

class AbsintheSocketOptions {
  AbsintheSocketOptions({this.params}) {
    params ??= {};
  }

  Map<String, String> params = {};
}

class Notifier<Result> {
  Notifier({this.request});

  GqlRequest request;
  List<Observer<Result>> observers = [];
  String subscriptionId;

  void observe(Observer observer) {
    observers.add(observer);
  }

  void notify(Map result) {
    observers.forEach((Observer observer) => observer.onResult(result));
  }

  void cancel() {
    observers.forEach((Observer observer) => observer.onCancel());
  }
}

class Observer<Result> {
  Observer(
      {this.onAbort, this.onCancel, this.onError, this.onStart, this.onResult});

  Function onAbort;
  Function onCancel;
  Function onError;
  Function onStart;
  Function onResult;
}

class GqlRequest {
  GqlRequest({this.operation});

  String operation;
}

class NotifierPushHandler<Response> {
  NotifierPushHandler({this.onError, this.onSucceed, this.onTimeout});

  Function onError;
  Function onSucceed;
  Function onTimeout;
}

class PushHandler<Response> {
  PushHandler({this.onError, this.onSucceed, this.onTimeout});

  Function onError;
  Function onSucceed;
  Function onTimeout;
}
