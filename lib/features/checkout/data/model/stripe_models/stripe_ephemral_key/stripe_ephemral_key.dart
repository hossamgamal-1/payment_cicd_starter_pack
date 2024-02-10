class StripeEphemralKey {
  final String secret;

  const StripeEphemralKey({required this.secret});

  factory StripeEphemralKey.fromJson(Map<String, dynamic> json) {
    return StripeEphemralKey(secret: json['secret'] as String);
  }
}
