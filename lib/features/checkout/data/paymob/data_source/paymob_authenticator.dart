import 'package:dio/dio.dart';

import '../../../../../../core/networking/dio_helper.dart';
import '../../../../../core/helpers/dotenv_helper.dart';
import '../../../../../core/networking/networking_helper.dart';
import '../model/paymob_authentication_input_model.dart';

class PaymobAuthenticator {
  final Dio _dio = DioHelper.instance;

  Future<Response> authenticate() async {
    const url = NetworkingHelper.paymobAuthenticationEndPoint;

    final jwt = DotEnvHelper.paymobApiKey;
    final inputModel = PaymobAuthenticationInputModel(apiKey: jwt);
    final data = inputModel.toJson();

    final response = await _dio.post(url, data: data);

    return response;
  }
}
