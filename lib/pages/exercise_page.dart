import 'package:edproject/dataSource/exercise_course_datasource.dart';
import 'package:edproject/model/exercise_course_model.dart';
import 'package:edproject/widget/exercise_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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

  final List<dynamic> test = [];

  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }

  void getInit() async {
    exerciseCourseResponse =
        await exerciseCourseDataSource.getExercise(courseId: widget.courseId);
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
        color: const Color(0xffF3F7F8),
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
            exerciseCourseResponse!.data!.isEmpty
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/icons/ilustrasi.svg'),
                        const Text(
                          'Yah, Paket tidak tersedia',
                          style: TextStyle(
                            fontSize: 26,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Tenang, masih banyak yang bisa kamu pelajari.\ncari lagi yuk!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xff99A1AC),
                            fontSize: 12,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                          ),
                        )
                      ],
                    ),
                  )
                : ExerciseListWidget(
                    exerciseCourseResponse: exerciseCourseResponse)
          ],
        ),
      ),
    );
  }
}
