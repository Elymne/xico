import 'package:http/http.dart' as http;

abstract class HttpFetch<T> {
  static Future<http.Response> read(String route) {
    return http.get(Uri.https('jsonplaceholder.typicode.com', route));
  }
}
