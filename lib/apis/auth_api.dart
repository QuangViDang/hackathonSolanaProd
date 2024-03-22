import 'dart:convert';
import 'dart:io';

import '../constants/constant.dart';
import '../util/util_constant.dart';

Future<Status?> checkAuth(email, reference) async {
  Status? statusResponse;
  String endpiont = GameShiftContants.urlGameShift;
  String url = endpiont + reference;
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
      String referenceIdGet = responseData['referenceId'];
      String emailGet = responseData['email'];
      if (email == emailGet && reference == referenceIdGet) {
        statusResponse?.isSuccess = true;
        return statusResponse;
      }
    } else {
      print('Failed with status code: ${response.statusCode}');
      statusResponse?.isSuccess = true;
      statusResponse?.message = "${response.statusCode}";
      return statusResponse;
    }
  } catch (e) {
    print('Error: $e');
    statusResponse?.isSuccess = true;
    statusResponse?.message = e as String;
    return statusResponse;
  }
}
