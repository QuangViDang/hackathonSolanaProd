import 'dart:convert';
import 'dart:io';

import 'package:auto_tickets_solana/constants/constant.dart';

Future<void> createUser(String password, String email) async {
  Map<String, dynamic> requestBody = {
    'email': email,
    'referenceId': password,
  };

  try {
    HttpClientRequest request = await HttpClient().postUrl(
      Uri.parse(GameShiftContants.urlGameShift),
    );
    request.headers.set('accept', 'application/json');
    request.headers.set('content-type', 'application/json');
    request.headers.set('x-api-key', GameShiftContants.x_api_key);
    request.add(utf8.encode(jsonEncode(requestBody)));
    HttpClientResponse response = await request.close();

    if (response.statusCode == 200) {
      // Xử lý dữ liệu trả về khi yêu cầu thành công
      print('Tạo người dùng thành công');
    } else {
      // Xử lý lỗi khi yêu cầu không thành công
      print('Lỗi: ${response.statusCode}');
      print('Nội dung lỗi: ${await response.transform(utf8.decoder).join()}');
    }
  } catch (error) {
    // Xử lý lỗi khi có lỗi xảy ra trong quá trình yêu cầu
    print('Lỗi: $error');
  }
}
