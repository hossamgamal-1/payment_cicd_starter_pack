import '../data/paymob/paymob_service.dart';
import '../data/paypal/paypal_service.dart';
import '../data/stripe/repo/stripe_repo.dart';
import '../data/stripe/stripe_service.dart';
import '../data/web_view_payment_gatway.dart';

class PaymentGatewayFactory {
  static PaymentGateway get(int activeIndex) {
    switch (activeIndex) {
      case 0:
        return StripeService(StripeRepo());
      case 1:
        return const PaypalService();
      case 2:
        return PaymobService();
      default:
        throw Exception('Invalid index');
    }
  }
}
