import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../stripe_service.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit() : super(PaymentInitial());
  final _stripeService = StripeService.instance;

  makePayment() async {
    emit(PaymentInProgress());
    try {
      await _stripeService.makePayment();
      emit(PaymentSuccess());
    } catch (e) {
      emit(PaymentFailure(e.toString()));
    }
  }

  @override
  void onChange(Change<PaymentState> change) {
    log('currentState: ${change.currentState} nextState: ${change.nextState}',
        name: 'PaymentCubit');
    super.onChange(change);
  }
}
