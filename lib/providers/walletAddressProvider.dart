import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import '../constants/constant.dart';
import '../models/userModel.dart';
import '../util/util_constant.dart';

class WalletAddressDataProvider extends ChangeNotifier {
  String _keyAddress = "";

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
        final Map<String, dynamic> walletAddressData =
            json.decode(response.body);
        WalletAddressModel data =
            WalletAddressModel.fromJson(walletAddressData);
        if (data != "") {
          // update WalletAddressCode
          statusResponse.isSuccess = true;
          statusResponse.message = "Connected";
          _keyAddress = data.walletAddress;
          notifyListeners();
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

  String getWalletAddress(BuildContext context) {
    return _keyAddress;
  }
}
