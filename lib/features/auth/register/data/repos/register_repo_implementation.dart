import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_api_cycle_8/core/errors/failure.dart';
import 'package:news_api_cycle_8/features/auth/register/data/repos/register_repo.dart';

class RegisterFirebaseImplementation implements RegisterRepo{
  @override
  Future<Either<Failure ,void>> register({required String email, required String pas, required BuildContext context})async {
    try {
      final credential =
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: pas,
      );

      // emit(RegisterSuccessState());

      return right(null);
      // success  --> > >> > >  >  >  >
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
 //   failure

    return left(FirebaseFailure(message: "weak-password"));

      } else if (e.code == 'email-already-in-use') {
        //   failure

        return left(FirebaseFailure(message: "email-already-in-use"));

      }else{
        return left(FirebaseFailure(message: "Error"));

      }
    } catch (e) {
      //   failure

      return left(FirebaseFailure(message: "Error"));

      print(e.toString());
    }
  }



}
