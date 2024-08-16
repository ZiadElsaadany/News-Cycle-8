import 'package:flutter/material.dart';
import 'package:news_api_cycle_8/features/splash/presentation/view/widgets/splash_body_widget.dart';

import '../../../../core/app_colors.dart';
import '../../../auth/login/presentstion/view/login_Screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(
      seconds: 3
    ),
        ( ) {
          navigateToLogin();
        }
    );

  }



  navigateToLogin( ) {
    Navigator.push(context, MaterialPageRoute(builder: (c) {
      return  const LoginScreen();
    } )) ;
  }



  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: SplashBody(),
    );
  }
}

