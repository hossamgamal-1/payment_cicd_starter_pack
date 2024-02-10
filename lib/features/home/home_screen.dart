import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:payment_cicd/core/extenstions.dart';

import '../checkout/presentation/checkout_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appBarColor = Theme.of(context).colorScheme.inversePrimary;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const Text('Home'),
        centerTitle: true,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: appBarColor,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
          systemNavigationBarColor: Colors.white,
          systemNavigationBarIconBrightness: Brightness.dark,
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.push(const CheckoutScreen()),
          child: const Text('Checkout'),
        ),
      ),
    );
  }
}
