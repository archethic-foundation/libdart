extension IntApis on int {
  String hex() {
    final String str = toRadixString(16);
    final int paddedLen = (str.length.isOdd ? 1 : 0) + str.length;
    return str.padLeft(paddedLen, '0').toUpperCase();
  }
}
