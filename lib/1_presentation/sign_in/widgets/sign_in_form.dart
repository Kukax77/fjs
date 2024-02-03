import 'package:auto_route/auto_route.dart';
import 'package:clean_rlg/0_core/custom_widgets/custom_image_button.dart';
import 'package:clean_rlg/0_core/custom_widgets/custom_sign_button.dart';
import 'package:clean_rlg/0_core/failures/auth_failures.dart';
import 'package:clean_rlg/1_presentation/router/router.gr.dart';
import 'package:clean_rlg/2_application/auth/signupform/sign_up_form_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignInForm extends StatelessWidget {
  const SignInForm({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final width = MediaQuery.sizeOf(context).width;

    final GlobalKey<FormState> formkey = GlobalKey<FormState>();
    late String email;
    late String password;

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

    final themeData = Theme.of(context);

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
          child: ListView(children: [
            SizedBox(
              height: height * 0.15,
            ),
            Center(
                child: Text(
              "Sign In",
              style: TextStyle(
                  fontWeight: FontWeight.bold, fontSize: height * 0.048),
            )),
            SizedBox(
              height: height * 0.05,
            ),
            Center(
                child: Text(
              "Enter your email and password",
              style: TextStyle(color: Colors.grey, fontSize: height * 0.0187),
            )),
            SizedBox(
              height: height * 0.16,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.075),
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  focusedBorder: const  UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Email",
                  hintStyle:
                      TextStyle(color: Colors.grey, fontSize: height * 0.018),
                ),
                validator: validateEmail,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.075),
              child: TextFormField(
                showCursor: true,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.black)),
                    hintText: "Password",
                    hintStyle:
                        TextStyle(color: Colors.grey, fontSize: height * 0.018),
                    suffixIcon: TextButton(
                      onPressed: () {ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                "Cringe",
                style: themeData.textTheme.bodyLarge!
                    .copyWith(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              backgroundColor: Colors.redAccent,
            ));},
                      child: Text("forgot password?",
                          style: TextStyle(
                              color: Colors.orangeAccent,
                              fontSize: height * 0.018)),
                    )),
                validator: validatePasswort,
                obscureText: true,
              ),
            ),
            SizedBox(
              height: height * 0.06,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.075),
              child: CustomSignButton(
                buttonText: "Login",
                onTap: () {
                  if (formkey.currentState!.validate()) {
                    BlocProvider.of<SignUpFormBloc>(context).add(
                        SignInWithEmailAndPasswordPressed(
                            email: email, password: password));
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text(
                        "Invalid e-mail password combination",
                        style: themeData.textTheme.bodyLarge!.copyWith(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      backgroundColor: Colors.redAccent,
                    ));

                    BlocProvider.of<SignUpFormBloc>(context).add(
                        SignInWithEmailAndPasswordPressed(
                            email: null, password: null));
                  }
                },
              ),
            ),
            SizedBox(
              height: height * 0.01,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                "Dont have an account?",
                style: TextStyle(fontSize: height * 0.0187),
              ),
              TextButton(
                  onPressed: () {
                    AutoRouter.of(context).replace(const SignUpRoute());
                  },
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                        fontSize: height * 0.0187,
                        decoration: TextDecoration.underline,
                        color: Colors.orangeAccent,
                        decorationColor: Colors.orangeAccent),
                  )),
            ]),
            SizedBox(
              height: height * 0.02,
            ),
            Container(
              constraints: BoxConstraints(maxWidth: width),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: width * 0.04),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Divider(
                      color: Colors.grey,
                      thickness: height * 0.001,
                      endIndent: width * 0.035,
                    )),
                    Text(
                      "Sign In with",
                      style: TextStyle(fontSize: height * 0.0187),
                    ),
                    Expanded(
                        child: Divider(
                      color: Colors.grey,
                      thickness: height * 0.001,
                      indent: width * 0.035,
                    )),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: height * 0.025,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomImageButton(
                      onTap: () {}, imagepath: 'assets/facebook.png'),
                  CustomImageButton(
                      onTap: () {}, imagepath: 'assets/linkedin.png'),
                  CustomImageButton(onTap: () {}, imagepath: 'assets/google.png')
                ],
              ),
            )
          ]),
        );
      },
    );
  }
}
