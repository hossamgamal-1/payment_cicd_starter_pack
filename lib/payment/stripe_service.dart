import 'dart:developer';
import 'dart:math' as math;

import 'package:flutter_stripe/flutter_stripe.dart';

import '../core/dotenv_helper.dart';
import 'data/repos/stripe_repo.dart';
import 'model/create_customer_input_model.dart';
import 'model/create_ephemeral_key_input_model.dart';
import 'model/create_payment_intent_input_model.dart';
import 'model/customer_stripe/customer_stripe.dart';
import 'model/init_payment_sheet_input_model.dart';
import 'model/payment_intent_model/payment_intent_model.dart';
import 'model/stripe_ephemral_key/stripe_ephemral_key.dart';

class StripeService {
  StripeService._();
  static final instance = StripeService._();

  final _stripeRepo = StripeRepo();

  static const _amount = 100;
  static const _currency = 'usd';

  static const _email = 'ahmedH1992@gmail.com';
  static const _name = 'Ahmed El Hossainy';

  static void init() {
    Stripe.publishableKey = DotEnvHelper.stripePublishableKey;
  }

  Future<void> makePayment() async {
    final customer = await _getCustomer();
    final paymentIntent = await _createPaymentIntent(customer.id);
    final ephemralKey = await _createEphemeralKey(customer.id);

    final inputModel = InitPaymentSheetInputModel(
      paymentIntentClientSecret: paymentIntent.clientSecret,
      customerId: customer.id,
      ephemeralKeySecret: ephemralKey.secret,
    );
    await _initPaymentSheet(inputModel);

    await _displayPaymentSheet();
  }

  Future<PaymentIntentModel> _createPaymentIntent(String customerId) async {
    final inputModel = CreatePaymentIntentInputModel(
      amount: _amount * math.Random().nextInt(10),
      currency: _currency,
      customerId: customerId,
    );

    return _stripeRepo.createPaymentIntent(inputModel);
  }

  Future<CustomerStripe> _getCustomer() async {
    const inputModel = CreateCustomerInputModel(email: _email, name: _name);

    return _stripeRepo.getCustomer(inputModel);
  }

  Future<StripeEphemralKey> _createEphemeralKey(String customerId) async {
    final inputModel = CreateEphemeralKeyInputModel(customerId);

    return _stripeRepo.createCustomerEphemeralKey(inputModel);
  }

  Future<void> _initPaymentSheet(InitPaymentSheetInputModel inputModel) async {
    await Stripe.instance.initPaymentSheet(
      paymentSheetParameters: SetupPaymentSheetParameters(
        paymentIntentClientSecret: inputModel.paymentIntentClientSecret,
        merchantDisplayName: _name,
        customerId: inputModel.customerId,
        customerEphemeralKeySecret: inputModel.ephemeralKeySecret,
      ),
    );
  }

  Future<void> _displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet();
    } catch (e) {
      log('payment sheet error: $e');
    }
  }
}
