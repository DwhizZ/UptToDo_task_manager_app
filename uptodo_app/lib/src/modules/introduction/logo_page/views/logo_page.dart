import 'package:flutter/material.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/config/routes/route_names.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => Navigator.pushNamed(context, RouteNames.introPage),
          child: Image.asset(AssetsPaths.logo),
        ),
      ),
    );
  }
}
