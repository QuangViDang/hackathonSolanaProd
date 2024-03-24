import 'dart:convert';
import 'package:auto_tickets_solana/models/userModel.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../constants/constant.dart';
import '../providers/walletAddressProvider.dart';
import '../util/util_constant.dart';

Future<StatusMessage?> checkAuth(context, email, reference) async {
  AuthModel? userModel;
  StatusMessage statusResponse = StatusMessage(false, "Unsuccessful!");
  String endpiont = GameShiftContants.urlGameShift;
  String userBrand = GameShiftContants.userEndpoint;
  String url = '$endpiont$userBrand/$reference';
  String api_key = GameShiftContants.x_api_key;

  try {
    final response = await http.get(
      Uri.parse(url),
      headers: {
        'accept': 'application/json',
        'x-api-key': api_key,
      },
    );

    // Kiểm tra phản hồi
    if (parseStatusCode(response.statusCode) == StatusCode.successGET) {
      final Map<String, dynamic> responseData = json.decode(response.body);
      userModel = AuthModel.fromJson(responseData);
      if (email == userModel.email && reference == userModel.referenceId) {
        Provider.of<WalletAddressDataProvider>(context, listen: false)
            .fetchWalletAddress(url, api_key);

        String walletAddress =
            Provider.of<WalletAddressDataProvider>(context, listen: false)
                .getWalletAddress();
        // print(walletAddress);
        if (walletAddress != "") {
          statusResponse.isSuccess = true;
          statusResponse.message = "Connected!";
        }
      }
    } else {
      print('Failed check user: ${response.statusCode}');
      statusResponse.message = "${response.statusCode}";
    }
  } catch (e) {
    print('Error: $e');
    statusResponse.message = e.toString();
  }
  return statusResponse;
}
