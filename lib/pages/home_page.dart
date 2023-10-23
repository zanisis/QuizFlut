import 'package:edproject/dataSource/baner_datasource.dart';
import 'package:edproject/dataSource/course_dataSource.dart';
import 'package:edproject/model/banner_model.dart';
import 'package:edproject/model/course_model.dart';
import 'package:edproject/widget/course_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final courseResponseData = CourseDataSource();
  final bannerResponseData = BannerDataSource();

  CourseResponse? courseResponse;
  BannerResponse? bannerResponse;

  @override
  void initState() {
    // TODO: implement initState
    getInit();
    super.initState();
  }

  void getInit() async {
    courseResponse = await courseResponseData.getCourse();
    bannerResponse = await bannerResponseData.getBanner();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF3F7F8),
      appBar: AppBar(
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
              courseResponse == null
                  ? const Center(child: CircularProgressIndicator())
                  : courseMenu(),
              const SizedBox(height: 24),
              bannerUpdated()
            ],
          ),
        ),
      ),
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
        SizedBox(
            height: 146,
            child: bannerResponse == null
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      final bannerData = bannerResponse?.data?[index];

                      return ClipRRect(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(10)),
                        child: Image.network(
                          bannerData?.eventImage ?? '',
                        ),
                      );
                    },
                    separatorBuilder: (context, index) =>
                        const SizedBox(width: 28),
                    itemCount: bannerResponse!.data!.length))
      ],
    );
  }

  Column courseMenu() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Pilih Pelajaran',
                style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w700)),
            TextButton(onPressed: () {}, child: const Text('Lihat Semua'))
          ],
        ),
        CourseListWidget(courseList: courseResponse?.data ?? [])
      ],
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
