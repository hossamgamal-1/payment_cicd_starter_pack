class PaymentIntentModel {
  final String clientSecret;

  const PaymentIntentModel({required this.clientSecret});

  factory PaymentIntentModel.fromJson(Map<String, dynamic> data) {
    return PaymentIntentModel(clientSecret: data['client_secret'] as String);
  }
}
