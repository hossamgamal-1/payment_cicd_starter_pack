import 'dart:developer';

import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:payment_cicd/core/dotenv_helper.dart';
import 'package:payment_cicd/paypal/model/paypal_transaction/paypal_transaction.dart';

class PaypalService {
  UsePaypal makePayment() {
    final transaction = PaypalTransaction.fromJson(
      {
        "amount": {
          "total": '10.12',
          "currency": "USD",
          "details": {
            "subtotal": '10.12',
            "shipping": '0',
            "shipping_discount": 0
          }
        },
        "description": "The payment transaction description.",
        "item_list": {
          "items": [
            {
              "name": "A demo product",
              "quantity": 1,
              "price": '10.12',
              "currency": "USD"
            }
          ],
        }
      },
    );
    final result = UsePaypal(
      sandboxMode: true,
      clientId: DotEnvHelper.paypalClientId,
      secretKey: DotEnvHelper.paypalSecretKey,
      returnURL: "https://samplesite.com/return",
      cancelURL: "https://samplesite.com/cancel",
      transactions: [transaction.toJson()],
      note: 'A note for the payment.',
      onSuccess: (params) => log("onSuccess: $params"),
      onError: (error) => log("onError: $error"),
      onCancel: (params) => log('cancelled: $params'),
    );

    return result;
  }
}
