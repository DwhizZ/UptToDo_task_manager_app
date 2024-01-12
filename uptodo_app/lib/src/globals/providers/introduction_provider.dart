import 'package:flutter/widgets.dart';
import 'package:uptodo_app/src/config/routes/route_names.dart';

class IntroductionProvider {
  IntroductionProvider(this.context);
  BuildContext context;

  void onLogoPageTap() {
    Navigator.pushNamed(context, RouteNames.manageTasksIntro);
  }

  void onSkip1Pressed() {
    Navigator.pushNamed(context, RouteNames.manageRoutineIntro);
  }

  void onSkip2Pressed() {
    Navigator.pushNamed(context, RouteNames.organizeTasksIntro);
  }

  void onSkip3Pressed() {
    Navigator.pushNamed(context, RouteNames.onboardingIntro);
  }
  void onBack1Pressed(){
    Navigator.pushNamed(context, RouteNames.logoPage);
  }
  void onBack2Pressed(){
    Navigator.pushNamed(context, RouteNames.manageTasksIntro);
  }
  void onBack3Pressed(){
    Navigator.pushNamed(context, RouteNames.manageRoutineIntro);
  }
  

  void onNext1Pressed() {
    Navigator.pushNamed(context, RouteNames.manageRoutineIntro);
  }

  void next2Pressed() {
    Navigator.pushNamed(context, RouteNames.organizeTasksIntro);
  }

  void getStartedPressed() {
    Navigator.pushNamed(context, RouteNames.onboardingIntro);
}
}