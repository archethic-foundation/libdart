import 'package:test/test.dart';

abstract class TestTags {
  static const integration = 'integration';
  static const noCI = 'noCI';
}

Matcher isValidIPAddress() => _IsValidIPAddress();

class _IsValidIPAddress extends Matcher {
  @override
  bool matches(Object? item, Map matchState) {
    if (item is! String) return false;

    final ipRegex = RegExp(
      r'^((25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])\.){3}(25[0-5]|2[0-4][0-9]|1[0-9]{2}|[1-9]?[0-9])$',
    );

    return ipRegex.hasMatch(item);
  }

  @override
  Description describe(Description description) =>
      description.add('a valid IPv4 address');

  @override
  Description describeMismatch(
    Object? item,
    Description mismatchDescription,
    Map matchState,
    bool verbose,
  ) {
    if (item is! String) {
      return mismatchDescription.add('is not a string');
    }
    return mismatchDescription.add('is not a valid IPv4 address');
  }
}
