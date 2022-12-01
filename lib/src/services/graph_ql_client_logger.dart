import 'dart:convert';
import 'dart:developer';

import 'package:gql/language.dart' show printNode;
import 'package:graphql/client.dart';

extension GraphQLClientWithLogger on GraphQLClient {
  /// Proxyfies a [GraphQLClient] with a [GraphQLClientLogger].
  GraphQLClient withLogger(String logName) => GraphQLClientLogger(
        client: this,
        logName: logName,
      );
}

/// [GraphQLClient] proxy that logs [query].
class GraphQLClientLogger implements GraphQLClient {
  final GraphQLClient client;
  final String logName;

  final JsonEncoder _jsonEncoder = const JsonEncoder.withIndent('  ');

  GraphQLClientLogger({
    required this.client,
    required this.logName,
  });

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
      'requestHttp.body=${printNode(options.document)}',
      name: logName,
    );

    final result = await client.query(options);

    if (result.hasException) {
      log(
        'responseHttp.error=${_jsonEncoder.convert(result.exception?.toJson)}',
        name: logName,
      );
    }
    log(
      'responseHttp.body=${_jsonEncoder.convert(result.data)}',
      name: logName,
    );

    return result;
  }

  @override
  readFragment(
    fragmentRequest, {
    optimistic = true,
  }) =>
      client.readFragment(
        fragmentRequest,
        optimistic: optimistic,
      );

  @override
  readQuery(
    request, {
    optimistic = true,
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
    fragmentRequest, {
    broadcast = true,
    required data,
  }) =>
      client.writeFragment(
        fragmentRequest,
        data: data,
      );

  @override
  void writeQuery(
    request, {
    required data,
    broadcast = true,
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
