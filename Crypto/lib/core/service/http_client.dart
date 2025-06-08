import 'package:http/http.dart' as http;
import 'package:order_manager/configs/api_constants.dart';

class HttpClient {
  static Future<http.Response> get(
    String path, [
    Map<String, String>? params,
  ]) async {
    final uri = Uri.parse(
      '${ApiConstants.baseUrl}$path',
    ).replace(queryParameters: params);
    final headers = {
      'X-CMC_PRO_API_KEY': ApiConstants.apiKey,
      'Accept': 'application/json',
    };

    return await http.get(uri, headers: headers);
  }
}
