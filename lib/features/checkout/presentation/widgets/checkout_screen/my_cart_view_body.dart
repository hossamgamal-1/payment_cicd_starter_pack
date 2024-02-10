import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:payment_cicd/features/checkout/logic/payment_cubit/payment_cubit.dart';

import '../../../../../../core/widgets/custom_button.dart';
import '../total_price_widget.dart';
import 'cart_info_item.dart';
import 'payment_methods_bottom_sheet.dart';

class MyCartViewBody extends StatelessWidget {
  const MyCartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const SizedBox(height: 18),
          Expanded(child: Image.asset('assets/images/basket_image.png')),
          const SizedBox(height: 25),
          const OrderInfoItem(title: 'Order Subtotal', value: r'42.97$'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Discount', value: r'0$'),
          const SizedBox(height: 3),
          const OrderInfoItem(title: 'Shipping', value: r'8$'),
          const Divider(thickness: 2, height: 34, color: Color(0xffC7C7C7)),
          const TotalPrice(title: 'Total', value: r'$50.97'),
          const SizedBox(height: 16),
          CustomButton(
            text: 'Complete Payment',
            onTap: () {
              const radiusUnit = Radius.circular(16);
              const radius = BorderRadius.only(
                topLeft: radiusUnit,
                topRight: radiusUnit,
              );
              showModalBottomSheet(
                  context: context,
                  shape: const RoundedRectangleBorder(borderRadius: radius),
                  builder: (context) {
                    return BlocProvider(
                      create: (context) => PaymentCubit(),
                      child: const PaymentMethodsBottomSheet(),
                    );
                  });
            },
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
