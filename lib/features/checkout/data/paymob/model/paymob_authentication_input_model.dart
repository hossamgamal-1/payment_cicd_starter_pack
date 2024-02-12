class PaymobAuthenticationInputModel {
  final String apiKey;

  const PaymobAuthenticationInputModel({required this.apiKey});

  Map<String, dynamic> toJson() => {'api_key': apiKey};
}
