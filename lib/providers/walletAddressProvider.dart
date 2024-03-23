import 'package:flutter/material.dart';
import '../models/userModel.dart';

class WalletAddressDataProvider extends ChangeNotifier {
  WalletAddressModel? _keyAddress;

  WalletAddressModel? get verifyWalletAddress => _keyAddress;

  void setWalletAddress(WalletAddressModel auth) async {
    _keyAddress = WalletAddressModel(walletAddress: auth.walletAddress);
    notifyListeners();
  }

  // Nếu bạn muốn hàm get chủ động, bạn có thể sử dụng nó trong constructor
  WalletAddressModel? getWalletAddress() {
    return _keyAddress;
  }
}
