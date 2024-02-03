import 'package:clean_rlg/1_presentation/router/router.dart';
import 'package:clean_rlg/2_application/auth/auth_bloc/auth_bloc.dart';
import 'package:clean_rlg/injection.dart';
import 'package:clean_rlg/theme.dart';
import 'package:firebase_core/firebase_core.dart';
//import 'package:clean_rlg/1_presentation/sign_up/sign_up_page.dart';
import 'package:flutter/material.dart';
import 'package:clean_rlg/injection.dart' as di;
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => sl<AuthBloc>()..add(AuthCheckRequestedEvent()))
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        routeInformationParser: _appRouter.defaultRouteParser(),
        routerDelegate: _appRouter.delegate(),
      ),
    );
  }
}
