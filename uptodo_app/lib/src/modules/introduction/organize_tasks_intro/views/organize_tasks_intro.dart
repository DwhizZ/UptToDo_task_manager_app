import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/globals/providers/introduction_provider.dart';
import 'package:uptodo_app/src/globals/widgets/introduction/back_and_next_button.dart';
import 'package:uptodo_app/src/globals/widgets/introduction/intro_image.dart';
import 'package:uptodo_app/src/globals/widgets/introduction/intro_texts.dart';
import 'package:uptodo_app/src/globals/widgets/skip_button.dart';

class OrganizeTasksIntro extends StatelessWidget {
  const OrganizeTasksIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<IntroductionProvider>();
    return SafeArea(
      child: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              SkipButton(
                onSkipPressed: provider.onSkip3Pressed,
              ),
              const IntroImage(
                introPng: AssetsPaths.organizeIntroImage,
                navPng: AssetsPaths.nav3,
              ),
              const IntroText(
                  mainText: 'Organize your tasks',
                  extraText: 'You can organize your daily tasks by \n'
                      'adding your tasks into separate categories'),
              BackAndNextButton(
                  textForButton: 'GET STARTED',
                  onNextButtonPressed: provider.getStartedPressed,
                  onBackButtonPressed: provider.onBack3Pressed),
            ],
          ),
        ),
      ),
    );
  }
}
