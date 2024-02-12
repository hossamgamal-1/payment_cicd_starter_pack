import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_cicd/features/checkout/data/web_view_payment_gatway.dart';

import '../../data/stripe/stripe_service.dart';
import '../payment_gateway_factory.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final StripeService _stripeService;
  CheckoutCubit(this._stripeService) : super(const Initial());

  Future<Widget?> makePayment(int activeIndex) async {
    emit(CheckoutLoading());

    final PaymentGateway gateWay = PaymentGatewayFactory.get(activeIndex);

    if (gateWay is WebViewPaymentGateway) {
      final page = await _getPaymentPage(gateWay);
      return page;
    } else {
      await _makePayment();
    }
    return null;
  }

  Future<void> _makePayment() async {
    final result = await _stripeService.makePayment();

    result.when(
      success: (success) => emit(const CheckoutSuccess()),
      failure: (handler) {
        final message = handler.errorModel.message ?? 'Error occurred';
        emit(CheckoutFailure(message));
      },
    );
  }

  Future<Widget> _getPaymentPage(WebViewPaymentGateway gateway) async {
    final result = await gateway.getPaymentPage(
      onSuccess: (params) => emit(const CheckoutSuccess()),
      onError: (error) {
        final errMessage = error is String ? error : 'Error occurred';
        emit(CheckoutFailure(errMessage));
      },
      onCancel: (_) => emit(const CheckoutFailure('Cancelled')),
    );

    return result;
  }

  void emitError(String error) => emit(CheckoutFailure(error));

  @override
  void onChange(Change<CheckoutState> change) {
    super.onChange(change);
    log(
      'currentState: ${change.currentState} nextState: ${change.nextState}',
      name: 'CheckoutCubit',
    );
  }
}
