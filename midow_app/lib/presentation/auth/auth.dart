import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:midow_app/presentation/blog/home.dart';
import 'package:midow_app/presentation/widgets/midow_buttons.dart';

import '../../core/utils/midow_colors.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

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
                buttonBorder: AppColors.primaryColor,
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: 'Sign up with Email',
                isFilled: false,
                isIconRight: false,
                withIcon: true,
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
                buttonBorder: AppColors.primaryColor,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()),
                  );
                },
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Already have an account? '),
                  GestureDetector(
                    onTap: () {
                      // Handle Sign In action
                    },
                    child: const Text(
                      'Sign in',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: height * 0.1),
              const Padding(
                padding: EdgeInsets.only(bottom: 50),
                child: Text(
                  'By signing up, you agree to our Terms of Service and '
                  'acknowledge that our Privacy Policy applies to you',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
