part of 'stripe_repo.dart';

class StripeCreateEphemeralKeyRepo {
  final _customerCreator = StripeEphemeralKeyCreator();
  Future<StripeEphemralKey> create(
      CreateEphemeralKeyInputModel inputModel) async {
    try {
      final response = await _customerCreator.create(inputModel);
      return StripeEphemralKey.fromJson(response.data);
    } on DioException catch (e) {
      log('createCustomer error: ${e.message}');
      rethrow;
    } catch (e) {
      log('createCustomer error: $e');
      rethrow;
    }
  }
}
