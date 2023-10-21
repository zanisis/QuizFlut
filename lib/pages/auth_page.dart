import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

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
            child: Column(children: [
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
            ]),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(left: 32, right: 32, bottom: 91),
              child:
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
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
                const SizedBox(height: 12),
                SizedBox(
                  height: 50,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black),
                      child: Row(
                        children: [
                          SvgPicture.asset('assets/icons/apple-logo.svg'),
                          const SizedBox(width: 12),
                          const Text('Masuk dengan Apple ID',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontFamily: 'Poppins',
                                fontSize: 17,
                                color: Color(0xffffffff),
                              )),
                        ],
                      )),
                )
              ]),
            ),
          )
        ],
      ),
    );
  }
}
