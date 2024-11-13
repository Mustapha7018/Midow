import 'package:flutter/material.dart';
import 'package:midow_app/core/utils/midow_buttons.dart';
import 'package:midow_app/features/auth/presentation/pages/login_page.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background_image.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Centered text
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Midow',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(
                  'Endless Ideas-\nOne Platform To Explore',
                  style: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w500,
                    height: 1.2,
                  ),
                ),
                SizedBox(height: 100)
              ],
            ),
          ),
          // Positioned button at the bottom
          Positioned(
            bottom: 60.0,
            left: 20,
            right: 20,
            child: CustomButton(
              text: 'Explore more',
              isFilled: false,
              withIcon: false,
              onPressed: () {
                Navigator.push(
                    context,
                    LoginPage.route()
                    );
              },
              textStyle: const TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
