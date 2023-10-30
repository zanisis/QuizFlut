import 'package:edproject/model/exercise_course_model.dart';
import 'package:flutter/material.dart';

class ExerciseListWidget extends StatelessWidget {
  final ExerciseCourseResponse? exerciseCourseResponse;

  const ExerciseListWidget({super.key, this.exerciseCourseResponse});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
        childAspectRatio: 1.19,
      ),
      itemBuilder: (context, index) {
        final exerciseData = exerciseCourseResponse?.data?[index];

        return Card(
          color: const Color(0xFFFFFFFF),
          child: Container(
            padding: const EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 53,
                  height: 53,
                  decoration: const BoxDecoration(
                      color: Color(0xFFEFFBFD),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Center(
                    child: Image.network(
                      height: 28,
                      width: 28,
                      exerciseData?.icon ?? '',
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 28,
                        height: 28,
                        decoration: const BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  exerciseData?.exerciseTitle ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${exerciseData?.jumlahDone ?? 0}/${exerciseData?.jumlahSoal ?? 0} Soal',
                  style: const TextStyle(
                    color: Color(0xff8E8E8E),
                    fontSize: 12,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          ),
        );
      },
      itemCount: 3,
    );
  }
}
