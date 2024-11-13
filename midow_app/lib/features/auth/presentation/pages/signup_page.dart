import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:midow_app/core/utils/loader.dart';
import 'package:midow_app/core/utils/show_snackbar.dart';
import 'package:midow_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:midow_app/features/auth/presentation/pages/login_page.dart';

import '../../../../core/utils/auth_form_field.dart';
import '../../../../core/utils/midow_buttons.dart';
import '../../../../core/utils/midow_colors.dart';

class SignupPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const SignupPage());
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    // confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // formKey.currentState!.validate();
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
            child: BlocConsumer<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthFailure) showSnackBar(context, state.message);
              },
              builder: (context, state) {
                if (state is AuthLoading) return const Loader();
                return Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/midow_logo.svg', height: 50),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'Create new account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColor,
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      AuthFormField(
                        controller: nameController,
                        hintText: 'Name',
                      ),
                      const SizedBox(
                        height: 15,
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
                      // AuthFormField(
                      //   controller: confirmPasswordController,
                      //   hintText: 'Confirm password',
                      //   isPassword: true,
                      // ),
                      const SizedBox(
                        height: 25,
                      ),
                      CustomButton(
                          text: 'Create account',
                          height: 55,
                          borderRadius: BorderRadius.circular(5),
                          textStyle: const TextStyle(
                              fontSize: 18, color: Colors.white),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              context.read<AuthBloc>().add(AuthSignUp(
                                    name: nameController.text.trim(),
                                    email: emailController.text.trim(),
                                    password: passwordController.text.trim(),
                                  ));
                            }
                          }),
                      const SizedBox(
                        height: 20,
                      ),
                      RichText(
                        text: TextSpan(
                          text: 'Already have an account? ',
                          style: const TextStyle(color: AppColors.primaryColor),
                          children: [
                            TextSpan(
                              text: 'Login',
                              style: const TextStyle(
                                fontWeight: FontWeight.w700,
                                decoration: TextDecoration.underline,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.push(
                                    context,
                                    LoginPage.route(),
                                  );
                                },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ));
  }
}
