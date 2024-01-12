
import 'package:flutter/material.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/app_styles.dart';

class CustomCreateAcctButton extends StatelessWidget {
  const CustomCreateAcctButton({
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
          backgroundColor: AppColors.systemGrey05Dark,
          side: const BorderSide(color: AppColors.systemPurple, width: 2.0),
        ),
        child: Text(
          'CREATE ACCOUNT',
          style: AppStyles.bodyStyle.copyWith(color: Colors.white),
        ),
      ),
    );
  }
}