class PaypalTransactionInputModel {
  final String currency;
  final int price;
  final String name;
  final int quantity;
  final int shipping;
  final String description;

  const PaypalTransactionInputModel({
    required this.currency,
    required this.price,
    required this.name,
    this.quantity = 1,
    this.shipping = 0,
    this.description = '',
  });

  String get total => (price * quantity + shipping).toString();

  String get subtotal => (price * quantity).toString();
}
