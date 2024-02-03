import 'package:auto_route/auto_route.dart';
import 'package:clean_rlg/1_presentation/sign_up/widgets/sign_up_form.dart';
import 'package:clean_rlg/2_application/auth/signupform/sign_up_form_bloc.dart';
import 'package:clean_rlg/injection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: BlocProvider(
        create: (context) => sl<SignUpFormBloc>(),
        child: const SignUpForm(),
      ),
    );
  }
}
