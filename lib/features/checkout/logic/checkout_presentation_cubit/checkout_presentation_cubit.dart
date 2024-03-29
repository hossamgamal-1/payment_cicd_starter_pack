import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_presentation_cubit.freezed.dart';
part 'checkout_presentation_state.dart';

class CheckoutPresentationCubit extends Cubit<CheckoutPresentationState> {
  CheckoutPresentationCubit() : super(const _Initial());

  int activeIndex = 0;

  void updatePaymentMethod(int index) {
    activeIndex = index;
    emit(PaymentMethodChanged(activeIndex));
  }

  final List<String> paymentMethodsItems = const [
    'assets/images/card.svg',
    'assets/images/paypal.svg',
    'assets/images/paypal.svg',
  ];

  @override
  void onChange(Change<CheckoutPresentationState> change) {
    log(
      'currentState: ${change.currentState} nextState: ${change.nextState}',
      name: 'PaymentCubit',
    );
    super.onChange(change);
  }
}
