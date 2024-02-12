class PaymobOrderIdModel {
  PaymobOrderIdModel({required this.orderId});

  final int orderId;

  factory PaymobOrderIdModel.fromJson(Map<String, dynamic> json) {
    return PaymobOrderIdModel(orderId: json["id"]);
  }

  Map<String, dynamic> toJson() => {"id": orderId};
}
