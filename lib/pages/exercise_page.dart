import 'dart:developer';

import 'package:edproject/dataSource/exercise_course_datasource.dart';
import 'package:edproject/model/exercise_course_modal.dart';
import 'package:flutter/material.dart';

class ExercisePage extends StatefulWidget {
  final String courseId;
  final String courseName;

  const ExercisePage(
      {super.key, required this.courseId, required this.courseName});

  @override
  State<ExercisePage> createState() => _ExercisePageState();
}

class _ExercisePageState extends State<ExercisePage> {
  final exerciseCourseDataSource = ExerciseCourseDataSource();

  ExerciseCourseResponse? exerciseCourseResponse;

  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }

  void getInit() async {
    exerciseCourseResponse =
        await exerciseCourseDataSource.getExercise(courseId: widget.courseId);
    log("response state ${exerciseCourseResponse?.toJson()}");
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: const Color(0xff3A7FD5),
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(widget.courseName,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700))),
      body: Container(
          color: Color(0xffF3F7F8),
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Pilih Paket Soal',
                style: TextStyle(
                  fontSize: 16,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),
              GridView.builder(
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
                      color: Color(0xFFFFFFFF),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10))),
                              child: Center(
                                child: Image.network(
                                  height: 28,
                                  width: 28,
                                  exerciseData?.icon ?? '',
                                  errorBuilder: (context, error, stackTrace) =>
                                      Container(
                                    width: 28,
                                    height: 28,
                                    decoration: const BoxDecoration(
                                        color: Colors.redAccent,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10))),
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
                  itemCount: 3)
            ],
          )),
    );
  }
}
