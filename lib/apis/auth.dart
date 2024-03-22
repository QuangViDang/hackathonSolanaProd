import 'dart:convert';
import 'dart:io';

import '../constants/constant.dart';
import '../util/util_constant.dart';

Future<void> getPassword(email, password) async {
  String endpiont = GameShiftContants.urlGameShift;
  String url = endpiont + password;
  String api_key = GameShiftContants.x_api_key;

  try {
    final HttpClient httpClient = HttpClient();
    final HttpClientRequest request = await httpClient.getUrl(url as Uri);
    request.headers.set('accept', 'application/json');
    request.headers.set('x-api-key', api_key);

    final HttpClientResponse response = await request.close();

    if (parseHttpStatus(response.statusCode) == HttpStatus.success) {
      // Phân tích phản hồi JSON
      Map<String, dynamic> responseData = jsonDecode(response as String);
      String referenceId = responseData['referenceId'];
      String email = responseData['email'];
    } else {
      print('Failed with status code: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: $e');
  }
}

