import 'package:flutter/material.dart';
import 'package:payment_cicd/features/checkout/data/paymob/paymob_web_view.dart';

import '../../../../core/helpers/dotenv_helper.dart';
import '../../../../core/networking/networking_helper.dart';
import '../web_view_payment_gatway.dart';
import 'model/paymob_payment_key_input_model.dart';
import 'model/paymob_register_order_request_model.dart';
import 'repo/paymob_repo.dart';

class PaymobService implements WebViewPaymentGateway {
  final PaymobRepo _paymobRepo = PaymobRepo();
  @override
  Future<Widget> getPaymentPage({
    required Function(dynamic) onSuccess,
    required Function(dynamic) onError,
    Function(dynamic)? onCancel,
  }) async {
    final authenticationToken = await _paymobRepo.authenticate();

    const amount = 1400;
    const currency = 'EGP';

    final inputModel = PaymobRegisterOrderInputModel(
      authToken: authenticationToken.token,
      amount: amount,
      currency: currency,
      deliveryNeeded: false,
      items: [_getPaymobOrderItemModels()],
    );

    final orderIdModel = await _paymobRepo.registerOrder(inputModel);

    final permenantKeyInputModel = PaymobPaymentKeyInputModel(
      orderId: orderIdModel.orderId.toString(),
      amount: amount,
      authToken: authenticationToken.token,
      billingData: _getPaymobBillingData(),
      currency: currency,
      integrationId: DotEnvHelper.paymobIntegrationId,
    );

    final paymentToken =
        await _paymobRepo.getPaymentToken(permenantKeyInputModel);

    final url = NetworkingHelper.getIframeUrl(paymentToken.token);

    final view = PaymobCheckoutView(
      onSuccess: onSuccess,
      onError: onError,
      onCancel: onCancel,
      url: url,
    );

    return view;
  }

  PaymobOrderItemModel _getPaymobOrderItemModels() {
    return const PaymobOrderItemModel(
      name: 'item1',
      amount: 200,
      description: 'item1 description',
      quantity: 2,
    );
  }

  PaymobBillingDataModel _getPaymobBillingData() {
    return const PaymobBillingDataModel(
      firstName: 'Hossam',
      lastName: 'Gamal',
      phoneNumber: '+201147320594',
      email: 'hossamgmal1313@gmail.com',
    );
  }
}
