import 'package:flutter_dotenv/flutter_dotenv.dart';

class DotEnvHelper {
  const DotEnvHelper._();

  static Future<void> init() async => await dotenv.load();

  static final stripeSecretKey = dotenv.env['STRIPE_TEST_SECRET_KEY']!;
  static final stripePublishableKey = dotenv.env['STRIPE_PUBLISHABLE_KEY']!;

  static final paypalClientId = dotenv.env['PAYPAL_CLIENT_ID']!;
  static final paypalSecretKey = dotenv.env['PAYPAL_SECRET_KEY']!;
}
