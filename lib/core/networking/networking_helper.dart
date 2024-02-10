abstract class NetworkingHelper {
  static const _stripeBaseUrl = 'https://api.stripe.com/v1';

  static const stripeCustomersEndPoint = "$_stripeBaseUrl/customers";
  static const stripeEphemralKeysEndPoint = "$_stripeBaseUrl/ephemeral_keys";
  static const stripePaymentIntentsEndPoint = "$_stripeBaseUrl/payment_intents";

  static Map<String, String> bearerTokenHelper(String token) {
    return {'Authorization': 'Bearer  $token'};
  }
}
