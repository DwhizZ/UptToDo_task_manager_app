import 'package:flutter/material.dart';
import 'package:uptodo_app/src/config/routes/route_names.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/edit_todo.dart';
import 'package:uptodo_app/src/modules/index/index_home/views/index_home.dart';
import 'package:uptodo_app/src/modules/introduction/intro_page.dart';
import 'package:uptodo_app/src/modules/introduction/logo_page/views/logo_page.dart';
import 'package:uptodo_app/src/modules/introduction/onboarding_intro/views/onboarding_intro.dart';
import 'package:uptodo_app/src/modules/authentication/log_in_screen/views/log_in_screen.dart';
import 'package:uptodo_app/src/modules/authentication/register_screen/views/register_screen.dart';

class RoutePath {
  static final routes = <String, WidgetBuilder>{
    RouteNames.logoPage: (_) => const LogoPage(),
    RouteNames.introPage: (_) => const IntroPage(),
    RouteNames.onboardingIntro: (_) => const OnboardingIntro(),
    RouteNames.logInScreen: (_) => const LogInScreen(),
    RouteNames.registerScreen: (_) => const RegisterScreen(),
    RouteNames.indexHome: (_) => const IndexHome(),
    RouteNames.editTodoPage: (_) => const EditTodoPage(),
  };
}
