import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/globals/widgets/onboarding/back_arrow_appbar.dart';
import 'package:uptodo_app/src/modules/onboarding/log_in_screen/provider/log_in_screen_provider.dart';
import '../components/login_fields.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<LogInScreenProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: BackArrowAppBar(onLeadingPressed: provider.onArrow1pressed),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: const LogInFields(),
          ),
        ),
      ),
    );
  }
}
