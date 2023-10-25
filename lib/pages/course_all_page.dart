import 'package:edproject/dataSource/course_datasource.dart';
import 'package:edproject/model/course_model.dart';
import 'package:edproject/widget/course_list_widget.dart';
import 'package:flutter/material.dart';

class CourseAllPages extends StatefulWidget {
  const CourseAllPages({super.key});

  @override
  State<CourseAllPages> createState() => _CourseAllPagesState();
}

class _CourseAllPagesState extends State<CourseAllPages> {
  final courseResponseData = CourseDataSource();

  CourseResponse? courseResponse;

  @override
  void initState() {
    // TODO: implement initState
    getBanner();
    super.initState();
  }

  void getBanner() async {
    courseResponse = await courseResponseData.getCourse();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F7F8),
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
              child: CourseListWidget(
                courseList: courseResponse?.data ?? [],
                isAll: true,
              ))),
    );
  }
}
