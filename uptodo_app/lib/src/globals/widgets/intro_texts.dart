import 'package:flutter/material.dart';

import '../../config/themes/app_styles.dart';

class IntroText extends StatelessWidget {
  final String mainText;
  final String extraText;
  const IntroText({
    super.key,
    required this.mainText,
    required this.extraText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10,bottom: 10),
            child: Text(
              mainText,
              style:
                  AppStyles.subHeaderStyle.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Text(
              extraText,
              style: AppStyles.bodyStyle.copyWith(fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
