import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:school_app/auth_service.dart';
import 'package:school_app/screens/forgot_password.dart';
import 'package:school_app/screens/input_schedule.dart';
import 'package:school_app/screens/main_screen.dart';
import 'package:school_app/screens/log_in.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:school_app/screens/sign_up.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticatioService>(
          create: (_) => AuthenticatioService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticatioService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AuthenticationWrapper(),
        title: 'Flutter Demo',
        theme: ThemeData(
          textButtonTheme: const TextButtonThemeData(
            style: ButtonStyle(enableFeedback: true),
          ),
        ),
        routes: {
          '/logIn': (context) => const LogInScreen(),
          '/signUp': (context) => const SignUpScreen(),
          '/forgotPassword': (context) => const ForgotPasswordScreen(),
          '/inputSchedule': (context) => const InputSchedule(),
        },
      ),
    );
  }
}

class AuthenticationWrapper extends StatelessWidget {
  const AuthenticationWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final User? firebaseUser = context.watch<User?>();

    if (firebaseUser != null) {
      return const MainScreen();
    }
    return const LogInScreen();
  }
}
