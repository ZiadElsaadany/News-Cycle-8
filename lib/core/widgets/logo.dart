import 'package:flutter/material.dart';

import '../app_images.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.asset(
          AppImages.logo,
          height: 80,
          width: 186,
        ),
         const SizedBox(height: 18,),
        Image.asset(
          AppImages.waveNewsImage,
          height: 24,
          width: 171,
        ),
      ],
    );
  }
}
