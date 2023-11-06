import 'package:edproject/bloc/auth/bloc/auth_bloc.dart';
import 'package:edproject/bloc/banner/banner_bloc.dart';
import 'package:edproject/bloc/course/course_bloc.dart';
import 'package:edproject/pages/course_all_page.dart';
import 'package:edproject/widget/banner_list_widget.dart';
import 'package:edproject/widget/bottom_navbar_widget.dart';
import 'package:edproject/widget/course_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectNavIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  void handleNavSelectedIndex(int index) {
    setState(() {
      selectNavIndex = index;
    });
  }

  static List<AppBar> appBarOption = [
    AppBar(
      title: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai, Altop',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                Text(
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
    AppBar(
      title: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hai, Altop',
                  style: TextStyle(
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w600),
                ),
                Text(
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
    AppBar(
      title: const Text(
        'Akun Saya',
        style: TextStyle(
          color: Colors.white,
          fontSize: 20,
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
        ),
      ),
      backgroundColor: const Color(0xff3A7FD5),
      centerTitle: true,
      actions: [
        GestureDetector(
          onTap: () {},
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Text('Edit',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400)),
          ),
        )
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyOption = [
      SingleChildScrollView(
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
      const Center(
        child: Text('Discuss'),
      ),
      BlocConsumer<AuthBloc, AuthState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is GetUserAuthSuccess) {
            return Column(
              children: [
                Container(
                  height: 110,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 22, vertical: 8),
                  decoration: const BoxDecoration(
                      color: Color(0xff3A7FD5),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10))),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(state.userResponse?.data?.userName ?? '',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400)),
                              Text(
                                  state.userResponse?.data?.userAsalSekolah ??
                                      '',
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400))
                            ],
                          ),
                          Image.asset(
                            'assets/icons/selfie2.png',
                            scale: 0.7,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14),
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.25),
                            spreadRadius: 0,
                            blurRadius: 10,
                            offset: Offset(0, 0), // changes position of shadow
                          )
                        ]),
                        child: Card(
                            color: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text('Identitas Diri',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Poppins',
                                          fontWeight: FontWeight.w400)),
                                  const SizedBox(
                                    height: 25,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Nama Lengkap',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 6),
                                      Text(
                                          state.userResponse?.data?.userName ??
                                              '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 16)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Email',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 6),
                                      Text(
                                          state.userResponse?.data?.userEmail ??
                                              '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 16)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Jenis Kelamin',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 6),
                                      Text(
                                          state.userResponse?.data
                                                  ?.userGender ??
                                              '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 16)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Kelas',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 6),
                                      Text(
                                          state.userResponse?.data?.kelas ?? '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 16)
                                    ],
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text('Sekolah',
                                          style: TextStyle(
                                              color: Colors.grey[500],
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 6),
                                      Text(
                                          state.userResponse?.data
                                                  ?.userAsalSekolah ??
                                              '',
                                          style: const TextStyle(
                                              fontSize: 14,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400)),
                                      const SizedBox(height: 16)
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      ),
                      const SizedBox(height: 24),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 22),
                          width: double.infinity,
                          height: 49,
                          decoration: const BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.25),
                                  spreadRadius: 0,
                                  blurRadius: 10,
                                  offset: Offset(
                                      0, 0), // changes position of shadow
                                )
                              ]),
                          child: Center(
                            child: Row(
                              children: [
                                SvgPicture.asset('assets/icons/log-in.svg'),
                                const SizedBox(
                                  width: 7,
                                ),
                                const Text('Keluar',
                                    style: TextStyle(
                                        color: Color(0xffEB5757),
                                        fontSize: 16,
                                        fontFamily: 'Poppins',
                                        fontWeight: FontWeight.w400))
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      )
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF3F7F8),
      appBar: appBarOption.elementAt(selectNavIndex),
      body: bodyOption.elementAt(selectNavIndex),
      bottomNavigationBar: BottomNavWidget(
          selectNavIndex: selectNavIndex,
          handleNavSelectedIndex: handleNavSelectedIndex),
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
}
