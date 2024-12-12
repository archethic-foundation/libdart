extension MapExt<K, V> on Map<K, V> {
  /// Maps every value of the [Map]
  Map<K, T> mapValues<T>(
    T Function(V value) valueToJson, {
    List<K> keysToIgnore = const [],
  }) =>
      Map.fromEntries(
        entries.where((entry) {
          return !keysToIgnore.contains(entry.key);
        }).map(
          (entry) => MapEntry(
            entry.key,
            valueToJson(entry.value),
          ),
        ),
      );

  /// Renames a key of the [Map]
  ///
  /// ! Destructive operation
  void renameKey(K previousKey, K newKey) {
    final value = this[previousKey];
    if (value == null) return;

    this[newKey] = value;
    remove(previousKey);
  }
}
