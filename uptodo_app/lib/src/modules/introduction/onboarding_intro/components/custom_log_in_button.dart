
import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/app_styles.dart';

class CustomLogInButton extends StatelessWidget {
  const CustomLogInButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(0, 50),
          backgroundColor: AppColors.systemPurple
        ),
        child:  Text(
          'LOGIN',
          style: AppStyles.bodyStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}