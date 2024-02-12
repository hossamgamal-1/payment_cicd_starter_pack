class PaymobPaymentKeyModel {
  final String token;

  const PaymobPaymentKeyModel({required this.token});

  factory PaymobPaymentKeyModel.fromJson(Map<String, dynamic> json) {
    return PaymobPaymentKeyModel(token: json['token']);
  }
}
