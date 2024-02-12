abstract class NetworkingHelper {
  static const _stripeBaseUrl = 'https://api.stripe.com/v1';

  static const stripeCustomersEndPoint = "$_stripeBaseUrl/customers";
  static const stripeEphemralKeysEndPoint = "$_stripeBaseUrl/ephemeral_keys";
  static const stripePaymentIntentsEndPoint = "$_stripeBaseUrl/payment_intents";

  static const _paymobBaseUrl = 'https://accept.paymob.com/api';
  static const paymobAuthenticationEndPoint = "$_paymobBaseUrl/auth/tokens";
  static const paymobRegisterOrderEndPoint = "$_paymobBaseUrl/ecommerce/orders";
  static const paymobCreatePermenantKeyEndPoint =
      "$_paymobBaseUrl/acceptance/payment_keys";

  static String getIframeUrl(String paymentToken) {
    return '$_paymobBaseUrl/acceptance/iframes/823818?payment_token=$paymentToken';
  }

  static Map<String, String> bearerTokenHelper(String token) {
    return {'Authorization': 'Bearer  $token'};
  }
}
