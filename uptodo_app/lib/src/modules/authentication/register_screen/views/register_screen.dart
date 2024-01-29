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

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> with Validator {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: BackArrowAppBar(onLeadingPressed: () {
          Navigator.pushNamed(context, RouteNames.logInScreen);
        }),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const OnboardHeader(onBoardHeader: 'Register'),
                  TextFieldWithHeader(
                      label: 'email',
                      controller: emailController,
                      validator: emailValidator,
                      hint: 'Enter your Username'),
                  TextFieldWithHeader(
                      label: 'Password',
                      controller: passwordController,
                      validator: passwordValidator,
                      hint: '************',
                      obscureText: true),
                  TextFieldWithHeader(
                      label: 'Confirm Password',
                      controller: password2Controller,
                      validator: (String? val) {
                        if (val != passwordController.text) {
                          return "Passwords do not match";
                        }
                        return null;
                      },
                      hint: '************',
                      obscureText: true),
                  context.watch<AuthenticationProvider>().isLoading
                      ? const SizedBox(
                          height: 55,
                          width: 55,
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : CustomLogInButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              context
                                  .read<AuthenticationProvider>()
                                  .emailSignUp(
                                      email: emailController.text,
                                      password: passwordController.text,
                                      onError: (value) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                            backgroundColor: Colors.redAccent,
                                            content: Text(value),
                                          ),
                                        );
                                      },
                                      onSuccess: () async {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(const SnackBar(
                                          content: Text(
                                              'Registration successful please check your email to verify your account'),
                                        ));
                                        await Future.delayed(
                                          const Duration(seconds: 2),
                                        ).then((value) {
                                          Navigator.pushNamed(
                                              context, RouteNames.logInScreen);
                                        });
                                      });
                            }
                          },
                          buttonText: 'Register'),
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
                      buttonText: 'Register with Google',
                      iconPath: AssetsPaths.googleIcon),
                  CustomElevatedButton(
                      onPressed: () {},
                      buttonText: 'Register with Apple',
                      iconPath: AssetsPaths.appleIcon),
                  OnboardingOptions(
                      onPressed: () {
                        Navigator.pushNamed(context, RouteNames.logInScreen);
                      },
                      textQuestion: 'Alraedy have an account?',
                      onboardText: 'Login'),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
