import 'dart:developer';

import 'package:edproject/bloc/auth/bloc/auth_bloc.dart';
import 'package:edproject/pages/auth_page.dart';
import 'package:edproject/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    handleUserHasLogin();
  }

  handleUserHasLogin() {
    FirebaseAuth.instance.authStateChanges().listen(
      (event) {
        Future.delayed(
          const Duration(seconds: 3),
          () {
            if (event != null) {
              context.read<AuthBloc>().add(
                    GetUserAuth(email: event.email ?? ''),
                  );
              handleNavigateHome();
            } else {
              handleNavigateAuth();
            }
          },
        );
      },
    );
  }

  void handleNavigateHome() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomePage(),
        ),
      );
    });
  }

  void handleNavigateAuth() {
    Future.delayed(const Duration(seconds: 1), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AuthPage(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff3A7FD5),
      body: Center(child: Image.asset('assets/icons/splash-logo.png')),
    );
  }
}
