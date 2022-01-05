extension DateTimeYYMMDDFormatApi on DateTime {
  String formatYYMMDD() {
    final String y = year.toString().substring(2, 4).padLeft(2, '0');
    final String m = month.toString().padLeft(2, '0');
    final String d = day.toString().padLeft(2, '0');
    return y + m + d;
  }
}
