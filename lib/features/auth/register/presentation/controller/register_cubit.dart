import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_api_cycle_8/features/auth/register/presentation/controller/register_states.dart';

import '../../data/repos/register_repo.dart';
import '../../data/repos/register_repo_implementation.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit({required this.registerRepo}) : super(RegisterInitialState());

  final RegisterRepo registerRepo;

  Future<void> signUpWithFirebase(
      {required String email,
      required String pas,
      required BuildContext context}) async {
    emit(RegisterLoadingState());
 var result = await   registerRepo.register(email: email, pas: pas, context: context);

 result.fold(
         (left){

           emit(RegisterFailureState(errorMessage: left.message));
         } ,
         (right) {
           emit(RegisterSuccessState());

         }
 );

  }
}
