import 'package:flutter/material.dart';

import 'custom_create_acct_button.dart';
import 'custom_log_in_button.dart';

class OnboardButtons extends StatelessWidget {
  const OnboardButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 370),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomLogInButton(),
          CustomCreateAcctButton(),
        ],
      ),
    );
  }
}
