import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:midow_app/core/utils/auth_form_field.dart';
import 'package:midow_app/core/utils/midow_buttons.dart';
import 'package:midow_app/core/utils/midow_colors.dart';
import 'package:midow_app/features/auth/presentation/pages/signup_page.dart';

import '../../../blog/presentation/pages/home.dart';

class LoginPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const LoginPage());
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/auth_background.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 100,
            left: 25,
            right: 25,
            bottom: 100,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset('assets/midow_logo.svg', height: 50),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Sign in to your account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryColor,
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                CustomButton(
                    text: 'Sign in with Google',
                    textStyle: const TextStyle(
                      color: AppColors.primaryColor,
                      fontSize: 16,
                    ),
                    iconTextSpacing: 15,
                    withIcon: true,
                    icon: Image.asset('assets/google_img.png'),
                    colorFill: AppColors.gray,
                    borderRadius: BorderRadius.circular(5),
                    height: 55,
                    onPressed: () {}),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                    text: 'Sign in with Gmail',
                    textStyle: const TextStyle(
                        color: AppColors.primaryColor, fontSize: 16),
                    iconTextSpacing: 15,
                    withIcon: true,
                    icon: Image.asset('assets/gmail_img.png'),
                    colorFill: AppColors.gray,
                    borderRadius: BorderRadius.circular(5),
                    height: 55,
                    onPressed: () {}),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "or Continue with",
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        color: Colors.grey.shade300,
                        thickness: 1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 25,
                ),
                 AuthFormField(
                    controller: emailController,
                    hintText: 'Email',
                  ),
                const SizedBox(
                  height: 15,
                ),
                AuthFormField(
                    controller: passwordController,
                    hintText: 'Password',
                    isPassword: true,
                  ),
                const SizedBox(
                  height: 15,
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot password?',
                    style: TextStyle(
                      color: AppColors.primaryColor,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                CustomButton(
                    text: 'Continue',
                    height: 55,
                    borderRadius: BorderRadius.circular(5),
                    textStyle:
                        const TextStyle(fontSize: 18, color: Colors.white),
                    onPressed: () {
                      Navigator.push(context, HomeScreen.route());
                    }),
                const SizedBox(
                  height: 20,
                ),
                RichText(
                  text: TextSpan(
                    text: 'Not a member? ',
                    style: const TextStyle(color: AppColors.primaryColor),
                    children: [
                      TextSpan(
                        text: 'Create Account',
                        style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                              context,
                              SignupPage.route(),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ));
  }
}
