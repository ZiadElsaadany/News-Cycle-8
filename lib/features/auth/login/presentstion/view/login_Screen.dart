import 'package:flutter/material.dart';
import 'package:news_api_cycle_8/core/app_colors.dart';
import 'package:news_api_cycle_8/core/widgets/logo.dart';
import 'package:news_api_cycle_8/features/auth/login/presentstion/view/widgets/login_form.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: LoginBody(),
    );
  }
}
class LoginBody extends StatelessWidget {
  const LoginBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(height: MediaQuery.sizeOf(context).height*0.12,),
        const LogoWidget(),
        const SizedBox(height: 43,),
        Expanded(
          child: Container(

            decoration: const BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80)
              )
            ),
            child:LoginForm() ,

          ),
        )


      ],
    );
  }
}




