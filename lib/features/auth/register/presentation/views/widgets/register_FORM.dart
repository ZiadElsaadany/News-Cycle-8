import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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
        CustomButton(
          title: "Sign Up",
          onPressed: () async {
            try {
              final credential =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
            } on FirebaseAuthException catch (e) {
              if (e.code == 'weak-password') {
                // print('The password provided is too weak.');
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("The password provided is too weak.")));
              } else if (e.code == 'email-already-in-use') {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("The account already exists for that email.")));
                print('The account already exists for that email.');
              }
            } catch (e) {
              print(e.toString());
            }
          },
        )
      ],
    );
  }
}
