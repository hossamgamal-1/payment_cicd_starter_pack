part of 'stripe_repo.dart';

class StripePaymentIntentRepo {
  final paymentIntentCreator = StripePaymentIntentCreator();

  Future<PaymentIntentModel> createPaymentIntent(
      CreatePaymentIntentInputModel inputModel) async {
    try {
      final response = await paymentIntentCreator.create(inputModel);
      return PaymentIntentModel.fromJson(response.data);
    } on DioException catch (e) {
      log('createPaymentIntent error: ${e.message}');
      rethrow;
    } catch (e) {
      log('createPaymentIntent error: $e');
      rethrow;
    }
  }
}
