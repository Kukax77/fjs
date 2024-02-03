import 'package:clean_rlg/2_application/auth/auth_bloc/auth_bloc.dart';
import 'package:clean_rlg/2_application/auth/signupform/sign_up_form_bloc.dart';
import 'package:clean_rlg/3_domain/repositories/auth_repository.dart';
import 'package:clean_rlg/4_infrasructure/repositories/auth_repository_impl.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.I;

Future<void> init() async {
   //extern
  final firestore = FirebaseFirestore.instance;
  sl.registerLazySingleton(() => firestore);

   //auth
  //state management
  sl.registerFactory(() => SignUpFormBloc(authRepository: sl()));
  sl.registerFactory(() => AuthBloc(authRepository: sl()));
  //repos
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(firebaseAuth: sl()));
  //extern
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);
}
