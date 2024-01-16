import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/routes/route_names.dart';
import 'package:uptodo_app/src/globals/providers/introduction_provider.dart';
import 'package:uptodo_app/src/modules/introduction/logo_page/views/logo_page.dart';
import 'package:uptodo_app/src/modules/introduction/manage_routine_intro/views/manage_routine_intro.dart';
import 'package:uptodo_app/src/modules/introduction/manage_tasks_intro/views/manage_tasks_intro.dart';
import 'package:uptodo_app/src/modules/introduction/onboarding_intro/views/onboarding_intro.dart';
import 'package:uptodo_app/src/modules/introduction/organize_tasks_intro/views/organize_tasks_intro.dart';
import 'package:uptodo_app/src/modules/onboarding/log_in_screen/provider/log_in_screen_provider.dart';
import 'package:uptodo_app/src/modules/onboarding/log_in_screen/views/log_in_screen.dart';

class RoutePath {
  static final routes = <String, WidgetBuilder>{
    RouteNames.logoPage: (_) => Provider(
        create: (context) => IntroductionProvider(context),
        child: const LogoPage()),
    RouteNames.manageTasksIntro: (_) => Provider(
        create: (context) => IntroductionProvider(context),
        child: const ManageTasksIntro()),
    RouteNames.manageRoutineIntro: (_) => Provider(
        create: (context) => IntroductionProvider(context),
        child: const ManageRoutineIntro()),
    RouteNames.organizeTasksIntro: (_) => Provider(
        create: (context) => IntroductionProvider(context),
        child: const OrganizeTasksIntro()),
    RouteNames.onboardingIntro: (_) => Provider(
        create: (context) => IntroductionProvider(_),
        child: const OnboardingIntro()),
    RouteNames.logInScreen: (_) => Provider(
        create: (context) => LogInScreenProvider(context),
        child: const LogInScreen()),
  };
}
