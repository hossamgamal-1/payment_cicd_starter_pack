class CreatePaymentIntentInputModel {
  final int amount;
  final String currency;
  final String? customerId;

  const CreatePaymentIntentInputModel({
    required this.amount,
    required this.currency,
    this.customerId,
  });

  Map<String, dynamic> toJson() {
    return {
      // stripe devides amount by 100 so we compensate this
      'amount': amount * 100,
      'currency': currency,
      'customer': customerId,
    };
  }
}
