import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:uptodo_app/src/config/assets_paths.dart';
import 'package:uptodo_app/src/config/routes/route_names.dart';
import 'package:uptodo_app/src/globals/providers/validator.dart';
import 'package:uptodo_app/src/globals/widgets/onboarding/back_arrow_appbar.dart';
import 'package:uptodo_app/src/globals/widgets/onboarding/custom_log_in_button.dart';
import 'package:uptodo_app/src/globals/widgets/onboarding/onboard_header.dart';
import 'package:uptodo_app/src/globals/widgets/onboarding/or_divider.dart';
import 'package:uptodo_app/src/modules/authentication/log_in_screen/components/custom_elevated_button.dart';
import 'package:uptodo_app/src/modules/authentication/log_in_screen/components/onboarding_options.dart';
import 'package:uptodo_app/src/modules/authentication/log_in_screen/components/text_field_with_header.dart';
import 'package:uptodo_app/src/modules/authentication/provider/auth_provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> with Validator {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BackArrowAppBar(onLeadingPressed: () {}),
        body: SingleChildScrollView(
          child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const OnboardHeader(onBoardHeader: 'Login'),
                  TextFieldWithHeader(
                    label: 'email',
                    controller: emailController,
                    validator: emailValidator,
                    hint: 'Enter your Username',
                  ),
                  TextFieldWithHeader(
                    label: 'Password',
                    controller: passwordController,
                    validator: passwordValidator,
                    hint: '*************',
                    obscureText: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: context.watch<AuthenticationProvider>().isLoading
                        ? const SizedBox(
                            height: 55,
                            width: 55,
                            child: Center(child: CircularProgressIndicator()),
                          )
                        : CustomLogInButton(
                            //Todo How to call a provider
                            onPressed: () {
                              //context.read<AuthenticationProvider>().logout();
                              //Nig
                              // Navigator.pushReplacementNamed(context, RouteNames.loginScreen);

                              context.read<AuthenticationProvider>().login(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    onError: (value) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          backgroundColor: Colors.redAccent,
                                          content: Text(
                                            value,
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    },
                                    onSuccess: () {
                                      Navigator.pushNamed(
                                          context, RouteNames.indexHome);
                                    },
                                  );
                            },
                            buttonText: 'Login'),
                  ),
                  const OrDivider(),
                  CustomElevatedButton(
                      onPressed: () {
                        context.read<AuthenticationProvider>().signInWithGoogle(
                            onError: (value) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.redAccent,
                              content: Text(value),
                            ),
                          );
                        }, onSuccess: () {
                          Navigator.pushNamed(context, RouteNames.indexHome);
                        });
                      },
                      buttonText: 'Login with Google',
                      iconPath: AssetsPaths.googleIcon),
                  CustomElevatedButton(
                      onPressed: () {},
                      buttonText: 'Login with Apple',
                      iconPath: AssetsPaths.appleIcon),
                  OnboardingOptions(
                    onPressed: () {
                      Navigator.pushNamed(context, RouteNames.registerScreen);
                    },
                    textQuestion: 'Don\'t have an account?',
                    onboardText: 'Register',
                  )
                ],
              )),
        ),
      ),
    );
  }
}
