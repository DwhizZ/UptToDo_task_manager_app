import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/globals/providers/introduction_provider.dart';

class LogoPage extends StatelessWidget {
  const LogoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<IntroductionProvider>();
    return Scaffold(
      body: Center(
        child: InkWell(onTap: provider.onLogoPageTap,child: Image.asset(AssetsPaths.logo)),
      ),

    );
  }
}