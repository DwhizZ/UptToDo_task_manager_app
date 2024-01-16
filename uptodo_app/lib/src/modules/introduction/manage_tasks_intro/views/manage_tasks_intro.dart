import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/globals/providers/introduction_provider.dart';
import '../../../../globals/widgets/introduction/back_and_next_button.dart';
import '../../../../globals/widgets/introduction/intro_image.dart';
import '../../../../globals/widgets/introduction/intro_texts.dart';
import '../../../../globals/widgets/skip_button.dart';

class ManageTasksIntro extends StatelessWidget {
  const ManageTasksIntro({Key? key}) : super(key: key);

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
                SkipButton(onSkipPressed: provider.onSkip1Pressed),
                const IntroImage(
                    introPng: AssetsPaths.manageIntroImage,
                    navPng: AssetsPaths.nav1),
                const IntroText(
                  mainText: 'Manage your tasks',
                  extraText:
                      'You can easily manage all of your daily\ntasks in DoMe for free',
                ),
                BackAndNextButton(
                    textForButton: 'NEXT',
                    onNextButtonPressed: provider.onNext1Pressed,
                    onBackButtonPressed: provider.onBack1Pressed),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
