import 'dart:developer';

import 'package:dio/dio.dart';

import '../../../core/flutter_secure_storage_helper.dart';
import '../../model/create_customer_input_model.dart';
import '../../model/create_ephemeral_key_input_model.dart';
import '../../model/create_payment_intent_input_model.dart';
import '../../model/customer_stripe/customer_stripe.dart';
import '../../model/payment_intent_model/payment_intent_model.dart';
import '../../model/stripe_ephemral_key/stripe_ephemral_key.dart';
import '../data_source/stripe_customer_creator.dart';
import '../data_source/stripe_ephemeral_key_creator.dart';
import '../data_source/stripe_payment_intent_creator.dart';

part 'stripe_create_customer_repo.dart';
part 'stripe_create_ephemeral_key_repo.dart';
part 'stripe_payment_intent_repo.dart';

class StripeRepo {
  final _paymentIntentRepo = StripePaymentIntentRepo();
  final _getCustomerRepo = StripeGetCustomerRepo();
  final _createEphemeralKeyRepo = StripeCreateEphemeralKeyRepo();

  Future<PaymentIntentModel> createPaymentIntent(
      CreatePaymentIntentInputModel inputModel) async {
    return await _paymentIntentRepo.createPaymentIntent(inputModel);
  }

  Future<CustomerStripe> getCustomer(
      CreateCustomerInputModel inputModel) async {
    return await _getCustomerRepo.getCustomer(inputModel);
  }

  Future<StripeEphemralKey> createCustomerEphemeralKey(
      CreateEphemeralKeyInputModel inputModel) async {
    return await _createEphemeralKeyRepo.create(inputModel);
  }
}
