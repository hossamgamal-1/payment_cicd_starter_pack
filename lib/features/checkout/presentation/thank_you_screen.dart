import 'package:flutter/material.dart';

import '../../../../core/widgets/custom_app_bar.dart';
import 'widgets/thank_view_screen/thank_you_view_body.dart';

class ThankYouScreen extends StatelessWidget {
  const ThankYouScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: const ThankYouViewBody(),
      ),
    );
  }
}
