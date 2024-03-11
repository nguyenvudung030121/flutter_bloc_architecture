import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../colors/AppColors.dart';
import '../../presentation.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currentIndex = 0;
  List pages = [const HomePage(), const SearchPage(), const ProfilePage()];
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView.builder(
              controller: _pageController,
              itemCount: pages.length,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) {
                return pages[index];
              }),
          Positioned(
              right: 10, left: 10, bottom: 10, child: bottomNavigationBar)
        ],
      ),
    );
  }

  Widget get bottomNavigationBar {
    return ClipRRect(
      borderRadius: BorderRadius.circular(40),
      child: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_work_outlined), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.screen_search_desktop_outlined),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle_outlined), label: 'Profile'),
        ],
        showSelectedLabels: true,
        showUnselectedLabels: false,
        selectedItemColor: AppColors.liberty,
        unselectedItemColor: AppColors.silverSand,
        onTap: _onItemTapped,
        currentIndex: currentIndex,
        backgroundColor: AppColors.eggblue,
      ),
    );
  }

  void _onItemTapped(int value) {
    setState(() {
      currentIndex = value;
      _pageController.animateToPage(value,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeInCubic);
    });
  }
}
