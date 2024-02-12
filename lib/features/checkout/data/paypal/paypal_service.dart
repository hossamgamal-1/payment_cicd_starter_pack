import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_paypal_payment/flutter_paypal_payment.dart';

import '../../../../core/helpers/dotenv_helper.dart';
import '../web_view_payment_gatway.dart';
import 'paypal_models/paypal_transaction/amount.dart';
import 'paypal_models/paypal_transaction/details.dart';
import 'paypal_models/paypal_transaction/item.dart';
import 'paypal_models/paypal_transaction/item_list.dart';
import 'paypal_models/paypal_transaction/paypal_transaction.dart';
import 'paypal_models/paypal_transaction_input_model.dart';

class PaypalService implements WebViewPaymentGateway {
  const PaypalService();

  @override
  Future<Widget> getPaymentPage({
    required Function(dynamic) onSuccess,
    required Function(dynamic) onError,
    Function(dynamic)? onCancel,
  }) async {
    const inputModel = PaypalTransactionInputModel(
      name: 'Hair Shampoo',
      currency: 'USD',
      price: 100,
    );
    final transaction = _getTransaction(inputModel);

    final result = PaypalCheckoutView(
      sandboxMode: true,
      clientId: DotEnvHelper.paypalClientId,
      secretKey: DotEnvHelper.paypalSecretKey,
      transactions: [transaction.toJson()],
      note: 'A note for the payment.',
      onSuccess: onSuccess,
      onError: onError,
      onCancel: onCancel ?? (params) => log('cancelled: $params'),
    );

    return result;
  }
}

PaypalTransaction _getTransaction(PaypalTransactionInputModel inputModel) {
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
