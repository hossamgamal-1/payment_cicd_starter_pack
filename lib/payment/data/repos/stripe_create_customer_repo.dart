part of 'stripe_repo.dart';

class StripeGetCustomerRepo {
  final _customerCreator = StripeCustomerCreator();
  Future<CustomerStripe> getCustomer(
      CreateCustomerInputModel inputModel) async {
    final cachedCustomer = await FlutterSecureStorageHelper.getCustomerStripe();
    if (cachedCustomer != null) return cachedCustomer;

    try {
      final response = await _customerCreator.createCustomer(inputModel);
      final customer = CustomerStripe.fromJson(response.data);

      FlutterSecureStorageHelper.setCustomerStripe(customer);
      return customer;
    } on DioException catch (e) {
      log('createCustomer error: ${e.message}');
      rethrow;
    }
  }
}
