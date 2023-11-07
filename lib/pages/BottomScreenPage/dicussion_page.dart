import 'package:flutter/material.dart';

class DiscussionPage extends StatelessWidget {
  const DiscussionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Diskusi Soal",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xff3A7FD5),
      ),
      body: const Center(
        child: Text('Discuss'),
      ),
    );
  }
}
