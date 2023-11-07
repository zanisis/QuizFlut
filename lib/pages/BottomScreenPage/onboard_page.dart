import 'package:edproject/bloc/auth/bloc/auth_bloc.dart';
import 'package:edproject/bloc/banner/banner_bloc.dart';
import 'package:edproject/bloc/course/course_bloc.dart';
import 'package:edproject/pages/course_all_page.dart';
import 'package:edproject/widget/banner_list_widget.dart';
import 'package:edproject/widget/course_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnBoardPage extends StatelessWidget {
  const OnBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      if (state is GetUserAuthSuccess) {
                        return Text(
                          state.userResponse?.data?.userName ?? '',
                          style: const TextStyle(
                              fontSize: 12,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600),
                        );
                      }
                      return const Text('-');
                    },
                  ),
                  const Text(
                    'Selamat Datangs',
                    style: TextStyle(
                        fontSize: 12,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              Image.asset('assets/icons/selfie2.png')
            ]),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 22),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              bannerAnnouncement(),
              const SizedBox(
                height: 25,
              ),
              courseMenu(),
              const SizedBox(height: 24),
              bannerUpdated()
            ],
          ),
        ),
      ),
    );
  }

  Container bannerAnnouncement() {
    return Container(
      height: 147,
      decoration: const BoxDecoration(
          color: Color(0xff3A7FD5),
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Mau kerjain\nlatihan soal\napa hari ini?',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
          SvgPicture.asset('assets/icons/group.svg')
        ],
      ),
    );
  }

  BlocBuilder<CourseBloc, CourseState> courseMenu() {
    return BlocBuilder<CourseBloc, CourseState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Pilih Pelajaran',
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700,
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CourseAllPages(),
                        ),
                      );
                    },
                    child: const Text('Lihat Semua'))
              ],
            ),
            if (state is CourseFailed) ...[
              Center(child: Text(state.message ?? ''))
            ] else if (state is CourseSuccess) ...[
              CourseListWidget(
                courseList: state.courseResponse.data ?? [],
                isAll: false,
              )
            ] else ...[
              const Center(child: CircularProgressIndicator())
            ]
          ],
        );
      },
    );
  }

  Column bannerUpdated() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Terbaru',
            style: TextStyle(
                fontSize: 16,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700)),
        const SizedBox(height: 12),
        BlocBuilder<BannerBloc, BannerState>(
          builder: (context, state) {
            if (state is BannerFailed) {
              return Center(child: Text(state.message ?? ''));
            }
            if (state is BannerSuccess) {
              return SizedBox(
                height: 146,
                child: BannerListWidget(
                  bannerList: state.bannerResponse.data ?? [],
                ),
              );
            }

            return const Center(child: CircularProgressIndicator());
          },
        )
      ],
    );
  }
}
