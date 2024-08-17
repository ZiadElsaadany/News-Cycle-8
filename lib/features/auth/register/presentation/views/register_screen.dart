import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/auth/register/presentation/controller/register_cubit.dart';
import 'package:news_api_cycle_8/features/auth/register/presentation/views/widgets/register_FORM.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/widgets/logo.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
  create: (context) => RegisterCubit(),
  child: Scaffold(
      appBar: AppBar(),
      backgroundColor: AppColors.primaryColor,
      body: SignUpBody() ,
    ),
);
  }
}class SignUpBody extends StatelessWidget {
  const SignUpBody({super.key});

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
            child:RegisterForm() ,

          ),
        )


      ],
    );
  }
}
