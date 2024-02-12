import '../../../../../core/helpers/flutter_secure_storage_helper.dart';
import '../data_source/stripe_customer_creator.dart';
import '../data_source/stripe_ephemeral_key_creator.dart';
import '../data_source/stripe_payment_intent_creator.dart';
import '../model/create_customer_input_model.dart';
import '../model/create_ephemeral_key_input_model.dart';
import '../model/create_payment_intent_input_model.dart';
import '../model/customer_stripe/customer_stripe.dart';
import '../model/payment_intent_model/payment_intent_model.dart';
import '../model/stripe_ephemral_key/stripe_ephemral_key.dart';

part 'stripe_create_customer_repo.dart';

class StripeRepo {
  final _getCustomerRepo = StripeGetCustomerRepo();
  final _ephemeralKeyCreator = StripeEphemeralKeyCreator();
  final _paymentIntentCreator = StripePaymentIntentCreator();

  Future<CustomerStripe> getCustomer(
      CreateCustomerInputModel inputModel) async {
    final customer = await _getCustomerRepo.getCustomer(inputModel);

    return customer;
  }

  Future<StripeEphemralKey> createCustomerEphemeralKey(
      CreateEphemeralKeyInputModel inputModel) async {
    final response = await _ephemeralKeyCreator.create(inputModel);

    return StripeEphemralKey.fromJson(response.data);
  }

  Future<PaymentIntentModel> createPaymentIntent(
      CreatePaymentIntentInputModel inputModel) async {
    final response = await _paymentIntentCreator.create(inputModel);

    return PaymentIntentModel.fromJson(response.data);
  }
}
