import 'package:flutter/material.dart';
import 'package:news_api_cycle_8/core/app_colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key,required this.title, this.onPressed});

  final String title; 
  final void Function()? onPressed ;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
     
     shape: RoundedRectangleBorder( 
       borderRadius: BorderRadius.circular(6)
     ),
      color: AppColors.primaryColor,
      onPressed: onPressed,
      child: Text( title,
      style: const TextStyle
        (
        color: AppColors.white,
        fontWeight: FontWeight.bold
      ),
      ),
    
    );
  }
}
