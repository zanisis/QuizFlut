import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text(
          'Edit Akun',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
          ),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff3A7FD5),
      ),
      body: const Center(
        child: Text('form'),
      ),
    );
  }
}
