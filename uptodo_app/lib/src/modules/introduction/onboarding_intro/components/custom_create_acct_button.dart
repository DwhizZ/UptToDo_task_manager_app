import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/globals/providers/introduction_provider.dart';

import '../../../../config/themes/app_colors.dart';
import '../../../../config/themes/app_styles.dart';

class CustomCreateAcctButton extends StatelessWidget {
  const CustomCreateAcctButton({
    super.key,
    required this.onPressed,
  });
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ElevatedButton(
        onPressed: onPressed,
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
