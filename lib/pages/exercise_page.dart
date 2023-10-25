import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  final String majorName;

  const ExercisePage({super.key, required this.majorName});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff3A7FD5),
          iconTheme: const IconThemeData(color: Colors.white),
          title: const Text('Pilih Pelajaran',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700))),
      body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: const Column(
            children: [
              Text('Pilih Paket Soal',
                  style: TextStyle(
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ))
            ],
          )),
    );
  }
}
