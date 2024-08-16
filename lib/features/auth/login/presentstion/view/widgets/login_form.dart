import 'package:flutter/material.dart';
import 'package:news_api_cycle_8/core/app_images.dart';
import 'package:news_api_cycle_8/core/widgets/custom_button.dart';

import '../../../../../../core/widgets/custom_field.dart';
import '../../../../register/presentation/views/register_screen.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  ListView(

      padding: EdgeInsets.all(25),
      children: [
        Image.asset(AppImages.loginImage,

        width: 72 ,
          height: 24,
        ),
        const SizedBox(height: 47,),
         CustomField(
          controller:emailController,
          title: "Email",
        ),
    const SizedBox(height: 24,)
    ,
         CustomField(
           controller: passwordController,
          suffixIcon:  Icon(Icons.visibility),
          title: "Password",
        ),
        const SizedBox(height: 9,),

        Text("Forgot the password?",
        textAlign: TextAlign.right,

        ),

        const SizedBox(height: 33),
        CustomButton(title: "Login",
        onPressed:   ( ) {


        },
        ),
        CustomButton(title: "SignUp",
        onPressed:  ( ) {
          Navigator.push(context, MaterialPageRoute(builder: (c) {
            return SignUpScreen( );
          } )) ;
        },
        )
      ],
    );
  }
}