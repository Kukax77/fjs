import 'package:auto_route/auto_route.dart';
import 'package:clean_rlg/0_core/custom_widgets/custom_sign_button.dart';
import 'package:clean_rlg/0_core/failures/auth_failures.dart';
import 'package:clean_rlg/1_presentation/router/router.gr.dart';
import 'package:clean_rlg/2_application/auth/signupform/sign_up_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpForm extends StatelessWidget {
  const SignUpForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    late String email;
    late String password;
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;
    final themeData = Theme.of(context);

    String? validateEmail(String? input) {
      const emailRegex =
          r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
      if (input == null || input.isEmpty) {
        return "please enter e-mail";
      } else if (RegExp(emailRegex).hasMatch(input)) {
        email = input;
        return null;
      } else {
        return "invalid e-mail format";
      }
    }

    String? validatePasswort(String? input) {
         if (input == null || input.isEmpty) {
        return "please enter password";
      } else if (input.length < 6) {
        return "password to short";
      } else {
        password = input;
        return null;
      }
    }

    String? confirmPassword(String? input, String? toConfirm){
      if( input == null || input.isEmpty){
        return "please confirm your password";
      }else if ( input!= password){
        return "passwords don't match";
      }else{
        password = input;
        return null;
      }
    }

    String mapFailureMessage(AuthFailure failure) {
      switch (failure.runtimeType) {
        case ServerFailure:
          return "something went wrong - maby check your conection";
        case EmailAlredyInUseFailure:
          return "email is alredy in use";
        case InvalidEmailAndPasswordCombinationFailure:
          return "invalid email and password combination";
        default:
          return "Ups! something went wrong...";
      }
    }

    return BlocConsumer<SignUpFormBloc, SignUpFormState>(
      listenWhen: (previous, current) =>
          previous.authFailureOrSuccessOption !=
          current.authFailureOrSuccessOption,
      listener: (context, state) {
        state.authFailureOrSuccessOption.fold(
          () => {},
          (eitherFailureOrSuccess) => eitherFailureOrSuccess.fold(
            (failure) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                mapFailureMessage(failure),
                style: themeData.textTheme.bodyLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.redAccent,
            )),
            (_) => AutoRouter.of(context).replace(const HomeRoute()),
          ),
        );
      },
      builder: (context, state) {
        return Form(
          autovalidateMode: state.showValidationMessages
              ? AutovalidateMode.always
              : AutovalidateMode.disabled,
          key: formkey,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: width * 0.075),
            child: ListView(children: [
              SizedBox(
                height: height * 0.15,
              ),
              Center(
                  child: Text(
                "Sign Up",
                style: TextStyle(
                    fontWeight: FontWeight.bold, fontSize: height * 0.048),
              )),
              SizedBox(
                height: height * 0.05,
              ),
              Center(
                  child: Text(
                "create your account",
                style: TextStyle(color: Colors.grey, fontSize: height * 0.0187),
              )),
              SizedBox(
                height: height * 0.16,
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Full name",
                  hintStyle:
                      TextStyle(color: Colors.grey, fontSize: height * 0.018),
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  focusedBorder: const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Email",
                  hintStyle:
                      TextStyle(color: Colors.grey, fontSize: height * 0.018),
                ),
                validator: validateEmail,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    contentPadding: EdgeInsets.only(top: height * -0.01),
                    hintText: "Password",
                    hintStyle:
                        TextStyle(color: Colors.grey, fontSize: height * 0.018),
                    suffix: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.orangeAccent,
                      ),
                    )),
                    validator: validatePasswort,
              ),
              TextFormField(
                obscureText: true,
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    contentPadding: EdgeInsets.only(top: height * -0.01),
                    hintText: "Confirm your password",
                    hintStyle:
                        TextStyle(color: Colors.grey, fontSize: height * 0.018),
                    suffix: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.visibility_off_outlined,
                        color: Colors.orangeAccent,
                      ),
                    )),
              ),
              SizedBox(
                height: height * 0.06,
              ),
              CustomSignButton(
                buttonText: "SIGN UP",
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    BlocProvider.of<SignUpFormBloc>(context).add(
                       RegisterWithEmailAndPasswordPressed(
                            email: email, password: password));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Invalid e-mail or password",
                        style: themeData.textTheme.bodyLarge!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Colors.redAccent,
                    ));

                    BlocProvider.of<SignUpFormBloc>(context).add(
                        RegisterWithEmailAndPasswordPressed(
                            email: null, password: null));
                  }
                },
              ),
              SizedBox(
                height: height * 0.03,
              ),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Text(
                  "Alredy have an account?",
                  style: TextStyle(fontSize: height * 0.0187),
                ),
                TextButton(
                    onPressed: () {
                      AutoRouter.of(context).replace(const SignInRoute());
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: height * 0.0187,
                          decoration: TextDecoration.underline,
                          color: Colors.orangeAccent,
                          decorationColor: Colors.orangeAccent),
                    ))
              ])
            ]),
          ),
        );
      },
    );
  }
}
