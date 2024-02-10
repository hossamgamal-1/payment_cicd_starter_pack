import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../logic/checkout_presentation_cubit/checkout_presentation_cubit.dart';
import 'payment_method_item.dart';

class PaymentMethodsListView extends StatelessWidget {
  const PaymentMethodsListView({super.key});

  @override
  Widget build(BuildContext context) {
    final read = context.read<CheckoutPresentationCubit>();
    return SizedBox(
      height: 62,
      child: ListView.builder(
          itemCount: read.paymentMethodsItems.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GestureDetector(
                onTap: () {
                  read.updatePaymentMethod(index);
                },
                child: BlocBuilder<CheckoutPresentationCubit,
                    CheckoutPresentationState>(
                  buildWhen: (previous, current) =>
                      current is PaymentMethodChanged,
                  builder: (context, state) {
                    return PaymentMethodItem(
                      isActive: read.activeIndex == index,
                      image: read.paymentMethodsItems[index],
                    );
                  },
                ),
              ),
            );
          }),
    );
  }
}
