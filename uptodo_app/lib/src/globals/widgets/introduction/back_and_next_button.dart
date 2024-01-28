import 'package:flutter/material.dart';
import '../../../config/themes/app_colors.dart';
import '../../../config/themes/app_styles.dart';

class BackAndNextButton extends StatelessWidget {
  final String textForButton;
  final VoidCallback onNextButtonPressed;
  final VoidCallback onBackButtonPressed;
  const BackAndNextButton({
    super.key,
    required this.textForButton,
    required this.onNextButtonPressed,
    required this.onBackButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: onBackButtonPressed,
          child: Text(
            'BACK',
            style: AppStyles.bodyStyle.copyWith(
                fontWeight: FontWeight.w300,
                color: AppColors.systemGrey02Light),
          ),
        ),
        ElevatedButton(
          onPressed: onNextButtonPressed,
          style:
              ElevatedButton.styleFrom(backgroundColor: AppColors.systemPurple),
          child: Text(
            textForButton,
            style: AppStyles.bodyStyle
                .copyWith(color: Colors.white, fontWeight: FontWeight.w300),
          ),
        ),
      ],
    );
  }
}
