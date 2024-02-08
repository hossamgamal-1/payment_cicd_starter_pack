import 'package:dio/dio.dart';

import '../../../core/dio_helper.dart';
import '../../../core/dotenv_helper.dart';
import '../../../core/networking_helper.dart';
import '../../model/create_payment_intent_input_model.dart';

class StripePaymentIntentCreator {
  final Dio _dio = DioHelper.instance;

  Future<Response> create(CreatePaymentIntentInputModel inputModel) async {
    const url = NetworkingHelper.stripePaymentIntentsEndPoint;

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
