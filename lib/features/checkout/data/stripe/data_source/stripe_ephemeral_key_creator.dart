import 'package:dio/dio.dart';

import '../../../../../../core/helpers/dotenv_helper.dart';
import '../../../../../../core/networking/dio_helper.dart';
import '../../../../../../core/networking/networking_helper.dart';
import '../model/create_ephemeral_key_input_model.dart';

class StripeEphemeralKeyCreator {
  final Dio _dio = DioHelper.instance;

  Future<Response> create(CreateEphemeralKeyInputModel inputModel) async {
    const url = NetworkingHelper.stripeEphemralKeysEndPoint;

    final jwt = DotEnvHelper.stripeSecretKey;
    final headers = NetworkingHelper.bearerTokenHelper(jwt);
    headers.addAll({'Stripe-Version': '2023-10-16'});

    final options = Options(
      headers: headers,
      contentType: Headers.formUrlEncodedContentType,
    );

    final data = inputModel.toJson();

    final response = await _dio.post(url, data: data, options: options);

    return response;
  }
}
