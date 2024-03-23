import 'dart:convert';
import 'package:auto_tickets_solana/models/userModel.dart';
import 'package:auto_tickets_solana/providers/walletAddressProvider.dart';
import 'package:http/http.dart' as http;

import '../constants/constant.dart';
import '../util/util_constant.dart';

Future<StatusMessage?> checkAuth(email, reference) async {
  AuthModel? userModel;
  StatusMessage? statusResponse;
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
        statusResponse = await fetchWalletAddress(url, api_key);
        return statusResponse;
      }
      return statusResponse;
    } else {
      print('Failed check user: ${response.statusCode}');
      statusResponse?.isSuccess = false;
      statusResponse?.message = "${response.statusCode}";
      return statusResponse;
    }
  } catch (e) {
    print('Error: $e');
    statusResponse?.isSuccess = false;
    statusResponse?.message = e.toString();
    return statusResponse;
  }
}

Future<StatusMessage> fetchWalletAddress(url, api_key) async {
  String walletAddress = GameShiftContants.walletAddressEndpoint;
  StatusMessage statusResponse = StatusMessage(false, "Unsuccessful!");
  try {
    final response = await http.get(
      Uri.parse('$url$walletAddress'),
      headers: {
        'accept': 'application/json',
        'x-api-key': api_key,
      },
    );

    // Kiểm tra phản hồi
    if (parseStatusCode(response.statusCode) == StatusCode.successGET) {
      final Map<String, dynamic> walletAddressData = json.decode(response.body);
      WalletAddressModel data = WalletAddressModel.fromJson(walletAddressData);
      if (data != "") {
        // update WalletAddressCode
        statusResponse.isSuccess = true;
        statusResponse.message = "Connected";
        WalletAddressDataProvider().setWalletAddress(data);
      } else {
        // Failed
        statusResponse.message = "WalletAddressCode Is Empty";
      }
    } else {
      // Failed
      print('Failed verifyWalletAddress: ${response.statusCode}');
      statusResponse.message = "StatusCode: ${response.statusCode}";
    }
  } catch (e) {
    // Failed
    print('Error: $e');
    statusResponse.message = e.toString();
  }
  return statusResponse;
}
