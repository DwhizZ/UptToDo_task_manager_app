import 'package:flutter/material.dart';
import 'package:uptodo_app/src/globals/widgets/introduction/intro_texts.dart';
import '../components/onboard_buttons.dart';
import '../components/page_app_bar.dart';

class OnboardingIntro extends StatelessWidget {
  const OnboardingIntro({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const PageAppBar(),
        body: Container(
          margin: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: const Column(
            children: [
              IntroText(
                  mainText: 'Welcome to UpTodo',
                  extraText: 'Please login to your account or create \n'
                      'new account to continue'),
              Spacer(),
              OnboardButtons()
            ],
          ),
        ),
      ),
    );
  }
}
