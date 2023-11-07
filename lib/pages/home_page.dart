import 'package:edproject/pages/BottomScreenPage/dicussion_page.dart';
import 'package:edproject/pages/BottomScreenPage/onboard_page.dart';
import 'package:edproject/pages/BottomScreenPage/profile_page.dart';
import 'package:edproject/widget/bottom_navbar_widget.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    List<Widget> bodyOption = [
      const OnBoardPage(),
      const DiscussionPage(),
      const ProfilePage()
    ];

    return Scaffold(
      backgroundColor: const Color(0xffF3F7F8),
      body: bodyOption.elementAt(selectNavIndex),
      bottomNavigationBar: BottomNavWidget(
          selectNavIndex: selectNavIndex,
          handleNavSelectedIndex: handleNavSelectedIndex),
    );
  }
}
