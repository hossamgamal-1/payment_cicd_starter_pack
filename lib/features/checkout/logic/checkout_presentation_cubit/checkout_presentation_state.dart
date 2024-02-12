part of 'checkout_presentation_cubit.dart';

@freezed
class CheckoutPresentationState with _$CheckoutPresentationState {
  const factory CheckoutPresentationState.initial() = _Initial;
  factory CheckoutPresentationState.paymentMethodChanged(int activeIndex) =
      PaymentMethodChanged;
}
