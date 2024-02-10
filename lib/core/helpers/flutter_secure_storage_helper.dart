import 'dart:convert';
import 'dart:developer';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../features/checkout/data/model/stripe_models/customer_stripe/customer_stripe.dart';

class FlutterSecureStorageHelper {
  static const _aOptions = AndroidOptions(encryptedSharedPreferences: true);

  static const _iOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock,
  );

  static const _storage = FlutterSecureStorage(
    aOptions: _aOptions,
    iOptions: _iOptions,
  );

  static const _customerStripeKey = 'customer_stripe';

  static Future<CustomerStripe?> getCustomerStripe() async {
    final customerStripeAsString = await _storage.read(key: _customerStripeKey);

    if (customerStripeAsString == null) return null;

    final customerData = jsonDecode(customerStripeAsString);
    final customer = CustomerStripe.fromJson(customerData);
    log('customer with id: ${customer.id} was read');

    return customer;
  }

  static Future<void> setCustomerStripe(CustomerStripe customerStripe) async {
    final customerData = jsonEncode(customerStripe.toJson());
    await _storage.write(key: _customerStripeKey, value: customerData);

    log('customer with id: ${customerStripe.id} was written');
  }
}
