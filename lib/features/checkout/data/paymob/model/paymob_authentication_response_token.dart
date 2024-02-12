class PaymobAuthenticationResponseToken {
  final String token;

  const PaymobAuthenticationResponseToken({required this.token});

  factory PaymobAuthenticationResponseToken.fromJson(
      Map<String, dynamic> json) {
    return PaymobAuthenticationResponseToken(token: json['token']);
  }
}
