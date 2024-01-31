import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/config/routes/route_names.dart';
import 'package:uptodo_app/src/modules/authentication/provider/auth_provider.dart';

class LogoPage extends StatefulWidget {
  const LogoPage({super.key});

  @override
  State<LogoPage> createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  @override
  void initState() {
    super.initState();
    checkUserProgress();
  }

  Future<void> checkUserProgress() async {
    final hasDoneOnboarding =
        await context.read<AuthenticationProvider>().hasDoneOnboardingFlow();
    if (hasDoneOnboarding) {
      if (mounted) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context)
              .pushReplacementNamed(RouteNames.onboardingIntro);
        });
      }
    } else {
      if (mounted) {
        Navigator.pushNamed(context, RouteNames.introPage);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.asset(AssetsPaths.logo),
      ),
    );
  }
}
