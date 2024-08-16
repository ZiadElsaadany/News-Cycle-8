import 'package:flutter/material.dart';

import '../app_colors.dart';

class CustomField extends StatelessWidget {
  const CustomField({super.key, required this.title, this.suffixIcon, required this.controller});

  final String title;
  final Widget ? suffixIcon;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(text: TextSpan(
         text:   title,   style:TextStyle(
        color: AppColors.black
    ),
         children: [
           TextSpan(
             text: "*",
            style:TextStyle(
                    color: AppColors.red
                  ),
           ),
         ]

        ),


        ),
        // Row(
        //   children: [
        //     Text(title),
        //     Text("*",
        //     style:TextStyle(
        //       color: AppColors.red
        //     ) ,
        //     ),
        //   ],
        // ),
        const SizedBox(height: 4,),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon:suffixIcon,
            enabledBorder:outlineInputBorder(AppColors.enabledBorderColor) ,
            focusedBorder: outlineInputBorder(AppColors.primaryColor)

          ),
        ),
      ],
    );
  }


  OutlineInputBorder outlineInputBorder(
      Color borderColor
      ) {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide:  BorderSide (
            color: borderColor
        )
    );
  }
}
