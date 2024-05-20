import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:classy/const/all_colors.dart';
import 'package:classy/home/home_screen.dart';
import 'package:classy/profile/profile-screen.dart';
import 'package:classy/settings/setting_screen.dart';
import 'package:flutter/material.dart';

class BottomNavController extends StatefulWidget {
  @override
  State<BottomNavController> createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomNavController> {
  int initialIndex = 0;
  List pages = [HomeScreen(), ProfileScreen(), SettingScreen()];
  // final _pageController = PageController(initialPage: 0);

  // @override
  // void dispose() {
  //   _pageController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: initialIndex,
        onTap: (value) {
          initialIndex=value;
          setState(() {
            
          });
        },
        selectedItemColor: AllColors.filledColor,
        iconSize: 30,
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
      ]),
      // extendBody: true,
      // bottomNavigationBar: (pages.length <= 3)
      //     ? AnimatedNotchBottomBar(
      //         notchBottomBarController:
      //             NotchBottomBarController(index: initialIndex),
      //         color: const Color(0xff6573F5),
      //         notchColor: const Color(0xff6573F5),
      //         showLabel: false,
      //         bottomBarItems: const [
      //           BottomBarItem(
      //             inActiveItem: Icon(
      //               Icons.home_filled,
      //               color: Colors.white,
      //             ),
      //             activeItem: Icon(
      //               Icons.home_filled,
      //               color: Colors.white,
      //             ),
      //             itemLabel: 'Home',
      //           ),
      //           BottomBarItem(
      //             inActiveItem: Icon(
      //               Icons.person,
      //               color: Colors.white,
      //             ),
      //             activeItem: Icon(
      //               Icons.person,
      //               color: Colors.white,
      //             ),
      //             itemLabel: 'Profile',
      //           ),

      //           ///svg item
      //           BottomBarItem(
      //             inActiveItem: Icon(
      //               Icons.settings,
      //               color: Colors.white,
      //             ),
      //             activeItem: Icon(
      //               Icons.settings,
      //               color: Colors.white,
      //             ),
      //             itemLabel: 'Settings',
      //           ),
      //         ],
      //         onTap: (value) {
      //           initialIndex = value;
      //           _pageController.jumpToPage(value);
      //           setState(() {});
      //         },
      //         kIconSize: 20,
      //         kBottomRadius: 20,
      //       )
      //     : null,
      // body: PageView(
      //  // controller: _pageController,
      //   physics: const NeverScrollableScrollPhysics(),
      //   children: List.generate(pages.length, (index) => pages[index]),
      // ),
      body: pages[initialIndex],
    );
  }
}
