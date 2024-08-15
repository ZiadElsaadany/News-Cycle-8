import 'package:flutter/material.dart';

import 'features/auth/login/presentation/views/login_screen.dart';

void main() {
  runApp(const NewsApp());
}

class NewsApp extends StatelessWidget {
  const NewsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoginScreen()
    );
  }
}
