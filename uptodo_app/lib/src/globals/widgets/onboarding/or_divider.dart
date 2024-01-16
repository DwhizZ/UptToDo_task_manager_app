
import 'package:flutter/material.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 25, bottom: 25),
      child: Image.asset(AssetsPaths.logInDivider),
    );
  }
}