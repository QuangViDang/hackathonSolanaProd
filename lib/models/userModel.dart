class AuthModel {
  final String? referenceId;
  final String? email;

  AuthModel({this.referenceId, this.email});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      referenceId: json['referenceId'],
      email: json['email'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'referenceId': referenceId,
      'email': email,
    };
  }
}

class WalletAddressModel {
  String walletAddress = "";

  WalletAddressModel({required this.walletAddress});

  factory WalletAddressModel.fromJson(Map<String, dynamic> json) {
    return WalletAddressModel(
      walletAddress: json['address'],
    );
  }
}
