import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/auth/register/presentation/controller/register_cubit.dart';
import 'package:news_api_cycle_8/features/auth/register/presentation/controller/register_states.dart';

import '../../../../../../core/app_images.dart';
import '../../../../../../core/widgets/custom_button.dart';
import '../../../../../../core/widgets/custom_field.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(25),
      children: [
        CustomField(
          controller: emailController,
          title: "Email",
        ),
        const SizedBox(
          height: 24,
        ),
        CustomField(
          controller: passwordController,
          suffixIcon: Icon(Icons.visibility),
          title: "Password",
        ),
        const SizedBox(
          height: 9,
        ),
        Text(
          "Forgot the password?",
          textAlign: TextAlign.right,
        ),
        const SizedBox(height: 33),
        BlocConsumer<RegisterCubit, RegisterStates>(
          
          listener: (context,state){
            if(state is RegisterFailureState){
              ScaffoldMessenger.of(context).showSnackBar( SnackBar(content: Text(state.errorMessage)));
            }
          },
          builder: (context, state) {
            return      state is  RegisterLoadingState?  const Center(child: CircularProgressIndicator()): CustomButton(
              title: "Sign Up",
              onPressed: () {
                BlocProvider.of<RegisterCubit>(context).signUpWithFirebase(
                    email: emailController.text.trim(),
                    pas: passwordController.text.trim(),
                    context: context);
              },
            );
          },
        )
      ],
    );
  }
}
