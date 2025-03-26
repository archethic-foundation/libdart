String extractTransactionErrorMessages(Map<String, dynamic> json) {
  final messageBuffer = StringBuffer();

  void extractMessages(Map<String, dynamic> map) {
    map.forEach((key, value) {
      if (key == 'message') {
        messageBuffer.write(' - ');
        messageBuffer.write(value);
        if (value is Map<String, dynamic>) {
          extractMessages(value);
        }
      } else if (value is Map<String, dynamic>) {
        extractMessages(value);
      }
    });
  }

  extractMessages(json);

  return messageBuffer.toString();
}
