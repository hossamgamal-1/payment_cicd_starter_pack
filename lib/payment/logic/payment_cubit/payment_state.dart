part of 'payment_cubit.dart';

abstract class PaymentState {
  // const PaymentState();
}

class PaymentInitial extends PaymentState {
  // const PaymentInitial();
}

class PaymentInProgress extends PaymentState {
  // const PaymentInProgress();
}

class PaymentSuccess extends PaymentState {
  // const PaymentSuccess();
}

class PaymentFailure extends PaymentState {
  final String error;
  PaymentFailure(this.error);
}
