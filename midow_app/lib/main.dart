import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:midow_app/core/utils/theme.dart';
import 'package:midow_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:midow_app/features/auth/presentation/pages/onboarding.dart';
import 'package:midow_app/init_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  // Force portrait mode
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  
  await initDependencies();
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (_) => serviceLocator<AuthBloc>(),
      ),
    ],
    child: const MidowApp(),
  ));
}

class MidowApp extends StatelessWidget {
  const MidowApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkThemeMode,
      home: const OnboardingScreen(),
    );
  }
}