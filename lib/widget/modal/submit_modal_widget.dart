import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SubmitModalWidget extends StatelessWidget {
  final void Function(BuildContext) submitAnswer;
  const SubmitModalWidget({super.key, required this.submitAnswer});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(38),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.40,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25.0),
          topRight: Radius.circular(25.0),
        ),
      ),
      child: Column(children: [
        SvgPicture.asset('assets/icons/diamon-answer.svg'),
        const SizedBox(height: 4),
        const Text(
          'Kumpulkan latihan soal sekarang?',
          style: TextStyle(
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
          ),
        ),
        const Text(
          'Boleh langsung kumpulin dong',
          style: TextStyle(
            color: Color(0xff9C9C9C),
            fontSize: 12,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 30),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                  side: const BorderSide(
                    color: Color(0xff3A7FD5),
                    width: 1,
                  ),
                ),
                child: const Text(
                  'Nanti dulu',
                  style: TextStyle(color: Color(0xff3A7FD5)),
                ),
              ),
            ),
            const SizedBox(width: 4),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  submitAnswer(context);
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff3A7FD5),
                  shape: const BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(5),
                    ),
                  ),
                ),
                child: const Text(
                  'Ya',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        )
      ]),
    );
  }
}
