import 'package:flutter/material.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yuk isi data diri',
          style: TextStyle(
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
