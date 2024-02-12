import 'package:payment_cicd/features/checkout/data/paymob/data_source/paymob_authenticator.dart';
import 'package:payment_cicd/features/checkout/data/paymob/model/paymob_authentication_response_token.dart';
import 'package:payment_cicd/features/checkout/data/paymob/model/paymob_order_id_model.dart';
import 'package:payment_cicd/features/checkout/data/paymob/model/paymob_payment_key_input_model.dart';
import 'package:payment_cicd/features/checkout/data/paymob/model/paymob_payment_key_model.dart';

import '../data_source/paymob_order_registerer.dart';
import '../data_source/paymob_payment_key_creator.dart';
import '../model/paymob_register_order_request_model.dart';

class PaymobRepo {
  final _authenticator = PaymobAuthenticator();
  final _orderRegisterer = PaymobOrderRegisterer();
  final _paymentKeyCreator = PaymobPaymentKeyCreator();

  Future<PaymobAuthenticationResponseToken> authenticate() async {
    final response = await _authenticator.authenticate();
    return PaymobAuthenticationResponseToken.fromJson(response.data);
  }

  Future<PaymobOrderIdModel> registerOrder(
      PaymobRegisterOrderInputModel inputModel) async {
    final response = await _orderRegisterer.registerOrder(inputModel);

    return PaymobOrderIdModel.fromJson(response.data);
  }

  Future<PaymobPaymentKeyModel> getPaymentToken(
      PaymobPaymentKeyInputModel inputModel) async {
    final response = await _paymentKeyCreator.getPaymentToken(inputModel);

    return PaymobPaymentKeyModel.fromJson(response.data);
  }
}
