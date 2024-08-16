import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:news_api_cycle_8/core/app_fonts.dart';
import 'package:news_api_cycle_8/features/splash/presentation/view/splash_screen.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: AppFonts.poppinsFont
      ),
      home: SplashScreen()
    );
  }
}
