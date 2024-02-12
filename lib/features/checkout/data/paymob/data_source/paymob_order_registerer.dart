import 'package:dio/dio.dart';
import 'package:payment_cicd/core/networking/dio_helper.dart';

import '../../../../../core/networking/networking_helper.dart';
import '../model/paymob_register_order_request_model.dart';

class PaymobOrderRegisterer {
  final _dio = DioHelper.instance;

  Future<Response> registerOrder(
      PaymobRegisterOrderInputModel inputModel) async {
    const url = NetworkingHelper.paymobRegisterOrderEndPoint;

    final data = inputModel.toJson();

    final response = await _dio.post(url, data: data);

    return response;
  }
}
