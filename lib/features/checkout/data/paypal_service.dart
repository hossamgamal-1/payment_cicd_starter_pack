import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';
import 'package:payment_cicd/core/extenstions.dart';

import '../../../core/dotenv_helper.dart';
import '../presentation/thank_you_screen.dart';
import 'model/paypal_models/paypal_transaction/amount.dart';
import 'model/paypal_models/paypal_transaction/details.dart';
import 'model/paypal_models/paypal_transaction/item.dart';
import 'model/paypal_models/paypal_transaction/item_list.dart';
import 'model/paypal_models/paypal_transaction/paypal_transaction.dart';
import 'model/paypal_models/paypal_transaction_input_model.dart';

class PaypalService {
  PaypalCheckoutView makePayment(BuildContext context) {
    const inputModel = PaypalTransactionInputModel(
      name: 'Hair Shampoo',
      currency: 'USD',
      price: 100,
    );
    final transaction = getTransaction(inputModel);

    final result = PaypalCheckoutView(
      sandboxMode: true,
      clientId: DotEnvHelper.paypalClientId,
      secretKey: DotEnvHelper.paypalSecretKey,
      transactions: [transaction.toJson()],
      note: 'A note for the payment.',
      onSuccess: (params) {
        log("onSuccess: $params");
        context.pop();
        context.pop();
        context.pushReplacement(const ThankYouScreen());
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Payment was successful')),
        );
      },
      onError: (error) {
        context.pop();
        context.pop();
        final snackBar = SnackBar(content: Text(error));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      },
      onCancel: (params) => log('cancelled: $params'),
    );

    return result;
  }
}

PaypalTransaction getTransaction(PaypalTransactionInputModel inputModel) {
  final amount = Amount(
    currency: inputModel.currency,
    total: inputModel.total,
    details: Details(
      shipping: inputModel.shipping.toString(),
      subtotal: inputModel.subtotal,
      shippingDiscount: 0,
    ),
  );
  final itemList = ItemList(
    items: [
      Item(
        currency: inputModel.currency,
        name: inputModel.name,
        price: inputModel.price.toString(),
        quantity: inputModel.quantity,
      ),
    ],
  );
  final transaction = PaypalTransaction(
    amount: amount,
    description: inputModel.description,
    itemList: itemList,
  );
  return transaction;
}
