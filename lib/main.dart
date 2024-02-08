import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_cicd/payment/logic/payment_cubit/payment_cubit.dart';

import 'core/dotenv_helper.dart';
import 'payment/stripe_service.dart';
import 'paypal/paypal_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await DotEnvHelper.init();
  // stripe service initialization must be after dotenv loading as it depends on it
  StripeService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('title'),
      ),
      body: null,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const PaymentButton(),
          const SizedBox(width: 10),
          FloatingActionButton(
            heroTag: 'paypal_payment',
            onPressed: () {
              builder(context) => PaypalService().makePayment();
              final route = MaterialPageRoute(builder: builder);
              Navigator.of(context).push(route);
            },
            tooltip: 'Increment',
            child: const Text('Paypal'),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class PaymentButton extends StatelessWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentState>(
        listenWhen: (previous, current) => current is PaymentFailure,
        listener: (context, state) {
          if (state is! PaymentFailure) return;

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        },
        builder: (context, state) {
          return FloatingActionButton(
            heroTag: 'stripe_payment',
            onPressed: () => context.read<PaymentCubit>().makePayment(),
            tooltip: 'Increment',
            child: state is PaymentInProgress
                ? const CircularProgressIndicator()
                : const Text('Pay'),
          );
        },
      ),
    );
  }
}
