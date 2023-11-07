import 'package:edproject/model/score_exercise_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ScoreModalWidget extends StatelessWidget {
  final ScoreExerciseResponse? scoreExerciseResponse;
  const ScoreModalWidget({super.key, this.scoreExerciseResponse});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: Row(
              children: [
                SvgPicture.asset('assets/icons/close.svg'),
                const Text(
                  'Tutup',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 70),
          Column(
            children: [
              const Text(
                'Selamat',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const Text(
                'Kamu telah menyelesaikan Kuiz ini',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              const SizedBox(height: 36),
              SvgPicture.asset('assets/icons/winner.svg'),
              const SizedBox(height: 24),
              const Text(
                'Nilai kamu :',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              ),
              Text(
                scoreExerciseResponse?.data?.result?.jumlahScore ?? '',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 96,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Poppins',
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
