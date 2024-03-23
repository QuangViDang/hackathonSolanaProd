import 'package:flutter/material.dart';

import '../models/userModel.dart';

class AuthDataProvider extends ChangeNotifier {
  AuthModel? _authorization;

  AuthModel? get authorization => _authorization;

  void setAuth(AuthModel auth) {
    _authorization =
        AuthModel(referenceId: auth.referenceId, email: auth.email);
    notifyListeners();
  }

  // Nếu bạn muốn hàm get chủ động, bạn có thể sử dụng nó trong constructor
  AuthModel? getAuth() {
    return _authorization;
  }
}
