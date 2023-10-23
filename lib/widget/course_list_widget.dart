import 'package:edproject/model/course_model.dart';
import 'package:flutter/material.dart';

class CourseListWidget extends StatelessWidget {
  final List<CourseData> courseList;
  const CourseListWidget({super.key, required this.courseList});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: 3,
        physics: const NeverScrollableScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(height: 15),
        itemBuilder: (context, index) {
          final dataCouse = courseList[index];

          return Container(
              height: 96,
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 22),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                children: [
                  Container(
                      width: 53,
                      height: 53,
                      decoration: const BoxDecoration(
                          color: Color(0xffF3F7F8),
                          borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Center(
                        child: Image.network(
                          height: 28,
                          width: 28,
                          dataCouse.urlCover ?? '',
                          errorBuilder: (context, error, stackTrace) =>
                              Container(
                            width: 28,
                            height: 28,
                            decoration: const BoxDecoration(
                                color: Colors.redAccent,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                          ),
                        ),
                      )),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(dataCouse.courseName ?? '',
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700)),
                        Text(
                            dataCouse.jumlahMateri == null &&
                                    dataCouse.jumlahDone == null
                                ? ''
                                : '${dataCouse.jumlahDone ?? ''}/${dataCouse.jumlahMateri ?? ''} Paket Latihan Soal',
                            style: const TextStyle(
                                fontSize: 12,
                                fontFamily: 'Poppins',
                                color: Color(0xff8E8E8E),
                                fontWeight: FontWeight.w500)),
                        const SizedBox(
                          height: 12,
                        ),
                        LinearProgressIndicator(
                            backgroundColor: const Color(0xffF3F7F8),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              Color(0xff3A7FD5),
                            ),
                            value: dataCouse.jumlahDone!.toDouble() /
                                        dataCouse.jumlahMateri!.toDouble() <
                                    0
                                ? 0
                                : 0),
                      ],
                    ),
                  )
                ],
              ));
        });
  }
}
