import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/app_styles.dart';

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String buttonText;

  final String iconPath;

  const CustomElevatedButton({
    Key? key,
    required this.onPressed,
    required this.buttonText,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(0, 50),
          backgroundColor: AppColors.systemGrey06Dark,
          side: const BorderSide(color: AppColors.systemPurple),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              iconPath,
            ),
            const SizedBox(width: 8),
            Text(
              buttonText,
              style: AppStyles.bodyStyle.copyWith(color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
