import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/auth/register/presentation/controller/register_states.dart';

class RegisterCubit extends Cubit<RegisterStates>{
  RegisterCubit():super(RegisterInitialState());


  signUpWithFirebase( {
    required String email ,
    required String pas ,
    required BuildContext context
}) async {

    /// loaading
    ///

    emit(RegisterLoadingState());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pas,
      );
      emit(RegisterSuccessState());
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {

        emit(RegisterFailureState(
          errorMessage: "Weak Password"
        ));

      } else if (e.code == 'email-already-in-use') {
     emit(RegisterFailureState(
       errorMessage: "Email Already In Use"
     ));
      }
    } catch (e) {
      emit(RegisterFailureState(
        errorMessage: "Oops, An Occurred Error ${e.toString()}"

      ));
      print(e.toString());
    }
  }


}