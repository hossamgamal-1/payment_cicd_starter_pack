import 'package:dio/dio.dart';
import 'package:payment_cicd/features/checkout/data/paymob/model/paymob_payment_key_input_model.dart';

import '../../../../../core/networking/dio_helper.dart';
import '../../../../../core/networking/networking_helper.dart';

class PaymobPaymentKeyCreator {
  final _dio = DioHelper.instance;

  Future<Response> getPaymentToken(
      PaymobPaymentKeyInputModel inputModel) async {
    const url = NetworkingHelper.paymobCreatePermenantKeyEndPoint;

    final data = inputModel.toJson();
    final response = await _dio.post(url, data: data);
    return response;
  }
}
