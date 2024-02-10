import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_cicd/core/extenstions.dart';
import 'package:payment_cicd/features/checkout/presentation/thank_you_screen.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../data/paypal_service.dart';
import '../../../logic/payment_cubit/payment_cubit.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key, required this.isPaypal});

  final bool isPaypal;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<PaymentCubit, PaymentState>(
      listenWhen: (previous, current) {
        return [PaymentFailure, PaymentSuccess].contains(current.runtimeType);
      },
      listener: (context, state) {
        context.pop();
        if (state is PaymentFailure) {
          final snackBar = SnackBar(content: Text(state.error));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is PaymentSuccess) {
          context.pushReplacement(const ThankYouScreen());
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () {
            if (isPaypal) {
              context.push(PaypalService().makePayment());
            } else {
              context.read<PaymentCubit>().makePayment();
            }
          },
          isLoading: state is PaymentInProgress,
          text: 'Continue',
        );
      },
    );
  }
}
