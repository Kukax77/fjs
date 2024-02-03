import 'package:auto_route/auto_route.dart';
import 'package:clean_rlg/1_presentation/router/router.gr.dart';
import 'package:clean_rlg/2_application/auth/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state is AuthStateAuthenticated) {
          context.router.replace(const SignInRoute());
        } else {
          context.router.replace(const SignInRoute());
        }
      },
      child: Scaffold(
        body: Center(
            child: CircularProgressIndicator(
          color: Theme.of(context).colorScheme.secondary,
        )),
      ),
    );
  }
}
