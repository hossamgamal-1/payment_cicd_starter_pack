class PaymobRegisterOrderInputModel {
  final String authToken;
  final bool deliveryNeeded;
  final int amount;
  final String currency;
  final List<PaymobOrderItemModel> items;

  const PaymobRegisterOrderInputModel({
    required this.authToken,
    required this.deliveryNeeded,
    required this.amount,
    required this.currency,
    required this.items,
  });

  Map<String, dynamic> toJson() {
    return {
      'auth_token': authToken,
      'delivery_needed': deliveryNeeded.toString(),
      'amount_cents': (amount * 100).toString(),
      'currency': currency,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

class PaymobOrderItemModel {
  final String name;
  final int amount;
  final String description;
  final int quantity;

  const PaymobOrderItemModel({
    required this.name,
    required this.amount,
    required this.description,
    required this.quantity,
  });

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'amount_cents': (amount * 100).toString(),
      'description': description,
      'quantity': quantity.toString(),
    };
  }
}
