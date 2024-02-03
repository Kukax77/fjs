
import 'package:clean_rlg/0_core/failures/auth_failures.dart';
import 'package:clean_rlg/3_domain/entities/user.dart';
import 'package:dartz/dartz.dart';


abstract class AuthRepository{

  Future<Either<AuthFailure,Unit>>registerWithEmailAndPassword({required String email, required String password});
  Future<Either<AuthFailure,Unit>>signInWithEmailAndPassword({required String email, required String password});
  Future<void>signOut();

  Option<CustomUser> getSignedInUser();
}