import 'dart:core';

class UrlParser {
  static Map<String, String> parseUrl(String url) {
    Uri uri = Uri.parse(url);
    Map<String, String> queryParams = uri.queryParameters;

    return queryParams;
  }
}
