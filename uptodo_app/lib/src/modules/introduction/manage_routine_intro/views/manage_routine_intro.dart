import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/globals/providers/introduction_provider.dart';
import 'package:uptodo_app/src/globals/widgets/introduction/back_and_next_button.dart';
import 'package:uptodo_app/src/globals/widgets/introduction/intro_image.dart';
import 'package:uptodo_app/src/globals/widgets/introduction/intro_texts.dart';
import 'package:uptodo_app/src/globals/widgets/skip_button.dart';

class ManageRoutineIntro extends StatelessWidget {
  const ManageRoutineIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<IntroductionProvider>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                SkipButton(onSkipPressed: provider.onSkip2Pressed),
                const IntroImage(
                    introPng: AssetsPaths.routineInroImage,
                    navPng: AssetsPaths.nav2),
                const IntroText(
                    mainText: 'Create daily routine',
                    extraText:
                        'In Uptodo  you can create your\npersonalized routine to stay productive'),
                BackAndNextButton(
                    textForButton: 'NEXT',
                    onNextButtonPressed: provider.next2Pressed,
                    onBackButtonPressed: provider.onBack2Pressed),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
