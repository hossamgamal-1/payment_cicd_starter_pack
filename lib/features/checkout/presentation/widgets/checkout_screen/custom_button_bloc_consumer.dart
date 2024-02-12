import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../core/extenstions.dart';
import '../../../logic/checkout_cubit/checkout_cubit.dart';
import '../../../logic/checkout_presentation_cubit/checkout_presentation_cubit.dart';
import '../../thank_you_screen.dart';

class CustomButtonBlocConsumer extends StatelessWidget {
  const CustomButtonBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    final logicCubit = context.read<CheckoutCubit>();
    final presentationCubit = context.read<CheckoutPresentationCubit>();
    return BlocConsumer<CheckoutCubit, CheckoutState>(
      listenWhen: (previous, current) {
        return [CheckoutFailure, CheckoutSuccess].contains(current.runtimeType);
      },
      listener: (context, state) {
        context.pop();
        if (state is CheckoutFailure) {
          final snackBar = SnackBar(
            content: Center(child: Text(state.error)),
            behavior: SnackBarBehavior.floating,
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
        if (state is CheckoutSuccess) {
          if (presentationCubit.activeIndex > 0) context.pop();

          context.pushReplacement(const ThankYouScreen());
        }
      },
      builder: (context, state) {
        return CustomButton(
          onTap: () async {
            final result =
                await logicCubit.makePayment(presentationCubit.activeIndex);

            if (!context.mounted) return;

            if (result != null) {
              context.push(
                PopScope(
                  onPopInvoked: (didPop) {
                    if (didPop && logicCubit.state is CheckoutLoading) {
                      logicCubit
                          .emitError('The payment flow has been canceled');
                    }
                  },
                  child: result,
                ),
              );
            }
          },
          isLoading: state is CheckoutLoading,
          text: 'Continue',
        );
      },
    );
  }
}
