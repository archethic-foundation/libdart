import 'dart:convert';
import 'package:archethic_lib_dart/src/utils/logs.dart';

import 'package:gql/language.dart' show printNode;
import 'package:graphql/client.dart';

extension GraphQLClientWithLogger on GraphQLClient {
  /// Proxyfies a [GraphQLClient] with a [GraphQLClientLogger].
  GraphQLClient withLogger(String logName, {bool logsActivation = true}) =>
      GraphQLClientLogger(
        client: this,
        logName: logName,
        logsActivation: logsActivation,
      );
}

/// [GraphQLClient] proxy that logs [query].
class GraphQLClientLogger implements GraphQLClient {
  GraphQLClientLogger({
    required this.client,
    required this.logName,
    this.logsActivation = true,
  });
  final GraphQLClient client;
  final String logName;
  final bool logsActivation;

  final JsonEncoder _jsonEncoder = const JsonEncoder.withIndent('  ');

  @override
  GraphQLCache get cache => client.cache;

  @override
  QueryManager get queryManager => client.queryManager;

  @override
  set queryManager(QueryManager queryManager) =>
      client.queryManager = queryManager;

  @override
  DefaultPolicies get defaultPolicies => client.defaultPolicies;

  @override
  set defaultPolicies(DefaultPolicies defaultPolicies) =>
      client.defaultPolicies = defaultPolicies;

  @override
  Link get link => client.link;

  @override
  GraphQLClient copyWith({
    String? logName,
    Link? link,
    GraphQLCache? cache,
    DefaultPolicies? defaultPolicies,
    bool? alwaysRebroadcast,
  }) =>
      GraphQLClientLogger(
        logName: logName ?? this.logName,
        client: client.copyWith(
          link: link,
          cache: cache,
          defaultPolicies: defaultPolicies,
          alwaysRebroadcast: alwaysRebroadcast,
        ),
      );

  @override
  Future<QueryResult<TParsed>> fetchMore<TParsed>(
    FetchMoreOptions fetchMoreOptions, {
    required QueryOptions<TParsed> originalOptions,
    required QueryResult<TParsed> previousResult,
  }) =>
      client.fetchMore(
        fetchMoreOptions,
        originalOptions: originalOptions,
        previousResult: previousResult,
      );

  @override
  Future<QueryResult<TParsed>> mutate<TParsed>(
    MutationOptions<TParsed> options,
  ) =>
      client.mutate(options);

  @override
  Future<QueryResult<TParsed>> query<TParsed>(
    QueryOptions<TParsed> options,
  ) async {
    log(
      '${DateTime.now()} requestHttp.body=${printNode(options.document)}',
      name: logName,
      logsActivation: logsActivation,
    );

    final result = await client.query(options);

    if (result.hasException) {
      log(
        '${DateTime.now()} responseHttp.error=${_jsonEncoder.convert(result.exception?.toJson)}',
        name: logName,
        logsActivation: logsActivation,
      );
    }
    log(
      '${DateTime.now()} responseHttp.body=${_jsonEncoder.convert(result.data)}',
      name: logName,
      logsActivation: logsActivation,
    );

    return result;
  }

  @override
  Map<String, dynamic>? readFragment(
    FragmentRequest fragmentRequest, {
    bool optimistic = true,
  }) =>
      client.readFragment(
        fragmentRequest,
        optimistic: optimistic,
      );

  @override
  Map<String, dynamic>? readQuery(
    Request request, {
    bool optimistic = true,
  }) =>
      client.readQuery(
        request,
        optimistic: optimistic,
      );

  @override
  Future<List<QueryResult<Object?>?>>? resetStore({
    bool refetchQueries = true,
  }) =>
      client.resetStore(refetchQueries: refetchQueries);

  @override
  Stream<QueryResult<TParsed>> subscribe<TParsed>(
    SubscriptionOptions<TParsed> options,
  ) =>
      client.subscribe(options);

  @override
  ObservableQuery<TParsed> watchMutation<TParsed>(
    WatchQueryOptions<TParsed> options,
  ) =>
      client.watchMutation(options);

  @override
  ObservableQuery<TParsed> watchQuery<TParsed>(
    WatchQueryOptions<TParsed> options,
  ) =>
      client.watchQuery(options);

  @override
  void writeFragment(
    FragmentRequest fragmentRequest, {
    bool? broadcast = true,
    required Map<String, dynamic> data,
  }) =>
      client.writeFragment(
        fragmentRequest,
        data: data,
      );

  @override
  void writeQuery(
    Request request, {
    required Map<String, dynamic> data,
    bool? broadcast = true,
  }) =>
      client.writeQuery(
        request,
        data: data,
      );
}

/// [OperationException] utils to do pretty printing.
extension OperationExceptionPrint on OperationException {
  Map<String, dynamic> get toJson => {
        'linkException': linkException.toString(),
        'graphqlErrors': graphqlErrors
            .map(
              (error) => {
                'message': error.message,
                'locations': error.locations.toString(),
              },
            )
            .toList(),
      };
}
