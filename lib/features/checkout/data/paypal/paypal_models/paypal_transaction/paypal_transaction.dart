import 'amount.dart';
import 'item_list.dart';

class PaypalTransaction {
  final Amount amount;
  final String description;
  final ItemList itemList;

  const PaypalTransaction({
    required this.amount,
    required this.description,
    required this.itemList,
  });

  factory PaypalTransaction.fromJson(Map<String, dynamic> json) {
    return PaypalTransaction(
      amount: Amount.fromJson(json['amount'] as Map<String, dynamic>),
      description: json['description'] as String,
      itemList: ItemList.fromJson(json['item_list'] as Map<String, dynamic>),
    );
  }

  Map<String, dynamic> toJson() => {
        'amount': amount.toJson(),
        'description': description,
        'item_list': itemList.toJson(),
      };
}
