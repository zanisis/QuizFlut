import 'package:edproject/bloc/auth/bloc/auth_bloc.dart';
import 'package:edproject/pages/home_page.dart';
import 'package:edproject/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F7F8),
      appBar: AppBar(
          backgroundColor: const Color(0xffF3F7F8),
          title: const Text('Login',
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold))),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/analysis.svg',
                ),
                const SizedBox(height: 50),
                const Text(
                  'Selamat Datang',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Poppins',
                      fontSize: 22),
                ),
                const Text(
                  'Selamat Datang di Aplikasi Widya Edu\nAplikasi Latihan dan Konsultasi Soal',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Poppins',
                    fontSize: 14,
                    color: Color(0xff6A7483),
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Expanded(
            child: BlocListener<AuthBloc, AuthState>(
              listener: (context, state) {
                if (state is AuthGoogleSignSuccess) {
                  if (state.userCredential != null) {
                    context.read<AuthBloc>().add(GetUserAuth(
                        email: state.userCredential?.user?.email ?? ''));
                  }
                }
                if (state is GetUserAuthSuccess) {
                  if (state.userResponse?.data?.iduser == '0') {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => RegisterPage(email: state.email),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  }
                }
              },
              child: Container(
                padding: const EdgeInsets.only(left: 32, right: 32, bottom: 91),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SizedBox(
                      height: 50,
                      child: ElevatedButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              barrierDismissible: false,
                              builder: (context) {
                                return WillPopScope(
                                  child: const Center(
                                    child: CircularProgressIndicator(
                                      color: Colors.white,
                                    ),
                                  ),
                                  onWillPop: () async {
                                    return false;
                                  },
                                );
                              },
                            );
                            context.read<AuthBloc>().add(SignInGoogleEvent());
                          },
                          child: Row(
                            children: [
                              Image.asset('assets/icons/google-logo.png'),
                              const SizedBox(width: 12),
                              const Text('Masuk dengan Google',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontFamily: 'Poppins',
                                    fontSize: 17,
                                    color: Color(0xff1A1F26),
                                  )),
                            ],
                          )),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
