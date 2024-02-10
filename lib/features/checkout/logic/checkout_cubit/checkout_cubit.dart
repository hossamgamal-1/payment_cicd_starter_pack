import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_cicd/features/checkout/data/paypal_service.dart';

import '../../data/stripe_service.dart';

part 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  final StripeService _stripeService = StripeService.instance;
  static const PaypalService _paypalService = PaypalService.instance;
  CheckoutCubit() : super(const Initial());

  Widget? makePayment(bool isPaypal) {
    emit(CheckoutLoading());

    if (isPaypal) {
      final page = _makePaypalPayment();
      return page;
    } else {
      _makeStripePayment();
    }
    return null;
  }

  void _makeStripePayment() async {
    final result = await _stripeService.makePayment();

    result.when(
      success: (success) => emit(CheckoutSuccess()),
      failure: (handler) {
        final message = handler.errorModel.message ?? 'Error occurred';
        emit(CheckoutFailure(message));
      },
    );
  }

  Widget _makePaypalPayment() {
    final result = _paypalService.makePayment(
      onSuccess: (params) => emit(CheckoutSuccess()),
      onError: (error) {
        emit(CheckoutFailure(error is String ? error : 'Error occurred'));
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
