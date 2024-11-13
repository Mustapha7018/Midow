import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midow_app/features/blog/presentation/pages/home.dart';
import 'package:midow_app/core/utils/midow_buttons.dart';

import '../../../../core/utils/midow_colors.dart';

class AuthScreen extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const AuthScreen());
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: height * 0.05),
              SvgPicture.asset('assets/midow_logo.svg', height: 150),
              SizedBox(height: height * 0.05),
              const Text(
                'Discover New',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const Text(
                'Ideas On Midow',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: height * 0.1),
              CustomButton(
                text: 'Sign up with Google',
                isFilled: false,
                isIconRight: false,
                withIcon: true,
                width: double.infinity,
                icon: const Icon(
                  FontAwesomeIcons.google,
                  size: 25,
                  color: AppColors.primaryColor,
                ),
                iconTextSpacing: 25,
                textStyle: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                ),
                colorFill: AppColors.primaryColor,
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Sign up with Email',
                isFilled: false,
                isIconRight: false,
                withIcon: true,
                width: double.infinity,
                icon: const Icon(
                  FontAwesomeIcons.solidEnvelope,
                  size: 25,
                  color: AppColors.primaryColor,
                ),
                iconTextSpacing: 25,
                textStyle: const TextStyle(
                  color: AppColors.primaryColor,
                  fontSize: 20,
                ),
                colorFill: AppColors.primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HomeScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              RichText(
                text: const TextSpan(
                  text: 'Already have an account? ',
                  style: TextStyle(color: AppColors.primaryColor),
                  children: [
                    TextSpan(
                      text: 'Sign in',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline),
                    ),
                  ],
                ),
              ),
              SizedBox(height: height * 0.1),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(
                      text: 'By signing up, you agree to our ',
                      style:
                          TextStyle(color: AppColors.accentColor, height: 1.6),
                      children: [
                        TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline)),
                        TextSpan(
                          text: ' and acknowledge that our ',
                          style: TextStyle(
                            color: AppColors.accentColor,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                        TextSpan(
                          text: ' applies to you.',
                          style: TextStyle(
                            color: AppColors.accentColor,
                          ),
                        ),
                      ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
