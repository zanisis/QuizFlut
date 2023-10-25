import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BottomNavWidget extends StatelessWidget {
  final int selectNavIndex;
  final void Function(int) handleNavSelectedIndex;

  const BottomNavWidget(
      {super.key,
      required this.selectNavIndex,
      required this.handleNavSelectedIndex});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(items: [
      BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/home-inactive.svg'),
          activeIcon: SvgPicture.asset('assets/icons/home-active.svg'),
          label: 'Home'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/discuss-inactive.svg'),
          activeIcon: SvgPicture.asset('assets/icons/discuss-active.svg'),
          label: 'Home'),
      BottomNavigationBarItem(
          icon: SvgPicture.asset('assets/icons/profile-inactive.svg'),
          activeIcon: SvgPicture.asset('assets/icons/profile-active.svg'),
          label: 'Home'),
    ], currentIndex: selectNavIndex, onTap: handleNavSelectedIndex);
  }
}
