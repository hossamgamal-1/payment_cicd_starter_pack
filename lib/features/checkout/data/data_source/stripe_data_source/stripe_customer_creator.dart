import 'package:dio/dio.dart';

import '../../../../../core/helpers/dotenv_helper.dart';
import '../../../../../core/networking/dio_helper.dart';
import '../../../../../core/networking/networking_helper.dart';
import '../../model/stripe_models/create_customer_input_model.dart';

class StripeCustomerCreator {
  final Dio _dio = DioHelper.instance;

  Future<Response> createCustomer(CreateCustomerInputModel inputModel) async {
    const url = NetworkingHelper.stripeCustomersEndPoint;

    final jwt = DotEnvHelper.stripeSecretKey;
    final options = Options(
      headers: NetworkingHelper.bearerTokenHelper(jwt),
      contentType: Headers.formUrlEncodedContentType,
    );

    final data = inputModel.toJson();

    final response = await _dio.post(url, data: data, options: options);

    return response;
  }
}
