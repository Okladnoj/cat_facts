class JsonParser {
  static DateTime? stringToDateTime(String? dateTimeString) {
    try {
      return DateTime.parse(dateTimeString ?? '');
    } catch (_) {
      return null;
    }
  }
}
