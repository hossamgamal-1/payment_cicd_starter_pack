class InitPaymentSheetInputModel {
  final String paymentIntentClientSecret;
  final String? customerId;
  final String? ephemeralKeySecret;

  const InitPaymentSheetInputModel({
    required this.paymentIntentClientSecret,
    this.customerId,
    this.ephemeralKeySecret,
  });
}
