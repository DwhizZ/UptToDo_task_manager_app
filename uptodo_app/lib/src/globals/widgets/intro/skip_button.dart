import 'package:flutter/material.dart';
import '../../../config/themes/app_colors.dart';
import '../../../config/themes/app_styles.dart';

class SkipButton extends StatelessWidget {
  final VoidCallback onSkipPressed;
  const SkipButton({
    super.key,
    required this.onSkipPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: onSkipPressed,
          child: Text(
            'SKIP',
            style: AppStyles.bodyStyle.copyWith(
                fontWeight: FontWeight.w400,
                color: AppColors.systemGrey02Light),
          ),
        )
      ],
    );
  }
}
