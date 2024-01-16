
import 'package:flutter/material.dart';

import '../../../config/themes/app_styles.dart';

class OnboardHeader extends StatelessWidget {
  const OnboardHeader({
    super.key, required this.onBoardHeader,
  });

  final String onBoardHeader;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5, bottom: 50),
      child: Text(
        onBoardHeader,
        style: AppStyles.subHeaderStyle.copyWith(fontSize: 38),
      ),
    );
  }
}