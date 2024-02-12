class PaymobPaymentKeyInputModel {
  final String authToken;
  final int amount;
  final int expiration;
  final String orderId;
  final PaymobBillingDataModel billingData;
  final String currency;
  final int integrationId;

  const PaymobPaymentKeyInputModel({
    required this.authToken,
    required this.amount,
    required this.orderId,
    required this.billingData,
    required this.currency,
    required this.integrationId,
    this.expiration = 3600,
  });

  Map<String, dynamic> toJson() {
    return {
      'auth_token': authToken,
      'amount_cents': (amount * 100).toString(),
      'expiration': expiration,
      'order_id': orderId,
      'billing_data': billingData.toJson(),
      'currency': currency,
      'integration_id': integrationId,
    };
  }
}

class PaymobBillingDataModel {
  final String apartment;
  final String email;
  final String floor;
  final String firstName;
  final String street;
  final String building;
  final String phoneNumber;
  final String shippingMethod;
  final String postalCode;
  final String city;
  final String country;
  final String lastName;
  final String state;

  const PaymobBillingDataModel({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.email,
    this.shippingMethod = 'NA',
    this.postalCode = 'NA',
    this.apartment = 'NA',
    this.building = 'NA',
    this.country = 'NA',
    this.street = 'NA',
    this.state = 'NA',
    this.floor = 'NA',
    this.city = 'NA',
  });

  Map<String, dynamic> toJson() {
    return {
      'apartment': apartment,
      'email': email,
      'floor': floor,
      'first_name': firstName,
      'street': street,
      'building': building,
      'phone_number': phoneNumber,
      'shipping_method': shippingMethod,
      'postal_code': postalCode,
      'city': city,
      'country': country,
      'last_name': lastName,
      'state': state,
    };
  }
}
