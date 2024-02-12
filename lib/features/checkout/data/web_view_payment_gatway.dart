import 'package:flutter/material.dart';

abstract class PaymentGateway {}

abstract class WebViewPaymentGateway extends PaymentGateway {
  Future<Widget> getPaymentPage({
    required Function(dynamic) onSuccess,
    required Function(dynamic) onError,
    Function(dynamic)? onCancel,
  });
}
