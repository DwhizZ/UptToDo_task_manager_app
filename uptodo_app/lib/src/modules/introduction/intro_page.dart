import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/config/routes/route_names.dart';
import 'package:uptodo_app/src/globals/widgets/introduction/back_and_next_button.dart';
import 'package:uptodo_app/src/globals/widgets/introduction/intro_image.dart';
import 'package:uptodo_app/src/globals/widgets/introduction/intro_texts.dart';
import 'package:uptodo_app/src/globals/widgets/skip_button.dart';
import 'package:uptodo_app/src/modules/authentication/provider/auth_provider.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            SkipButton(onSkipPressed: () async {
              await context
                  .read<AuthenticationProvider>()
                  .setDoneOnboardingFlow();
              if (mounted) {
                Navigator.of(context)
                    .pushReplacementNamed(RouteNames.onboardingIntro);
              }
            }),
            SizedBox(
              height: size.height * 0.8,
              child: PageView(
                controller: _pageController,
                children: const [
                  Column(
                    children: [
                      IntroImage(
                          introPng: AssetsPaths.manageIntroImage,
                          navPng: AssetsPaths.nav1),
                      IntroText(
                        mainText: 'Manage your tasks',
                        extraText:
                            'You can easily manage all of your daily\ntasks in DoMe for free',
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      IntroImage(
                          introPng: AssetsPaths.routineInroImage,
                          navPng: AssetsPaths.nav2),
                      IntroText(
                          mainText: 'Create daily routine',
                          extraText:
                              'In Uptodo  you can create your\npersonalized routine to stay productive'),
                    ],
                  ),
                  Column(
                    children: [
                      IntroImage(
                        introPng: AssetsPaths.organizeIntroImage,
                        navPng: AssetsPaths.nav3,
                      ),
                      IntroText(
                          mainText: 'Organize your tasks',
                          extraText: 'You can organize your daily tasks by \n'
                              'adding your tasks into separate categories'),
                    ],
                  ),
                ],
              ),
            ),
            const Spacer(),
            BackAndNextButton(
                textForButton: 'NEXT',
                onNextButtonPressed: () async {
                  if (_pageController.page == 2) {
                    await context
                        .read<AuthenticationProvider>()
                        .setDoneOnboardingFlow();
                    if (mounted) {
                      Navigator.of(context)
                          .pushReplacementNamed(RouteNames.onboardingIntro);
                    }
                  }
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                },
                onBackButtonPressed: () {
                  _pageController.previousPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeIn);
                }),
          ],
        ),
      )),
    );
  }
}
