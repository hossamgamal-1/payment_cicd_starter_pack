import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'core/checkout_app.dart';
import 'core/helpers/dotenv_helper.dart';
import 'features/checkout/data/stripe/stripe_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Future.wait([
    DotEnvHelper.init(),
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]),
  ]);

  // stripe service initialization must be after dotenv loading as it depends on it
  StripeService.init();

  runApp(const CheckoutApp());
}
