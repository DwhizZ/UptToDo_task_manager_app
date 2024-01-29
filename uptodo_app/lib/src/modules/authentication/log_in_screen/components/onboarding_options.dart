import 'package:flutter/material.dart';
import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/app_styles.dart';

class OnboardingOptions extends StatelessWidget {
  const OnboardingOptions({
    super.key,
    required this.onPressed,
    required this.textQuestion,
    required this.onboardText,
  });
  final VoidCallback onPressed;
  final String textQuestion;
  final String onboardText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            textQuestion,
            style:
                AppStyles.bodyStyle.copyWith(color: AppColors.systemGrey02Dark),
          ),
          TextButton(
            onPressed: onPressed,
            child: Text(onboardText, style: AppStyles.bodyStyle),
          ),
        ],
      ),
    );
  }
}
