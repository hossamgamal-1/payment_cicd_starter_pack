class CustomerStripe {
  final String id;

  CustomerStripe({required this.id});

  factory CustomerStripe.fromJson(Map<String, dynamic> json) {
    return CustomerStripe(id: json['id'] as String);
  }

  Map<String, dynamic> toJson() => {'id': id};
}
