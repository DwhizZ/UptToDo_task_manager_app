import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/config/themes/app_styles.dart';
import 'package:uptodo_app/src/modules/onboarding/log_in_screen/components/text_field_with_header.dart';
import 'package:uptodo_app/src/modules/onboarding/log_in_screen/provider/log_in_screen_provider.dart';

import '../../../../globals/widgets/custom_log_in_button.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var provider = context.read<LogInScreenProvider>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: Padding(
            padding: const EdgeInsets.only(left: 15),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.arrow_back_ios_new_outlined),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 50),
                  child: Text(
                    'Login',
                    style: AppStyles.subHeaderStyle.copyWith(fontSize: 38),
                  ),
                ),
                TextFieldWithHeader(
                  label: 'Username',
                  controller: provider.userNameController,
                  validator: provider.userNameValidator,
                  hint: 'Enter your Username',
                ),
                TextFieldWithHeader(
                  label: 'Password',
                  controller: provider.passwordController,
                  validator: provider.passwordValidator,
                  hint: '*************',
                  obscureText: true,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, bottom: 25),
                  child: CustomLogInButton(onPressed: () {}, buttonText: 'Login'),
                ),
                Image.asset(AssetsPaths.logInDivider),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
