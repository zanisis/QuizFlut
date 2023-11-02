import 'package:edproject/bloc/course/course_bloc.dart';
import 'package:edproject/widget/course_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseAllPages extends StatelessWidget {
  const CourseAllPages({super.key});

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
      body: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(22),
              child: BlocBuilder<CourseBloc, CourseState>(
                builder: (context, state) {
                  if (state is CourseFailed) {
                    return Center(child: Text(state.message ?? ''));
                  }
                  if (state is CourseSuccess) {
                    return CourseListWidget(
                      courseList: state.courseResponse.data ?? [],
                      isAll: true,
                    );
                  }

                  return const Center(child: CircularProgressIndicator());
                },
              ))),
    );
  }
}
