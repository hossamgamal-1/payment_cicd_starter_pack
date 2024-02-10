part of 'checkout_cubit.dart';

abstract class CheckoutState {}

class Initial implements CheckoutState {
  const Initial();
}

class CheckoutLoading implements CheckoutState {}

class CheckoutSuccess implements CheckoutState {}

class CheckoutFailure implements CheckoutState {
  final String error;
  const CheckoutFailure(this.error);
}
