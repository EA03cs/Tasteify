import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Feature/Home/presentation/Screens/Home.dart';
import 'package:tasteify/Feature/Favourite/presentation/Screen/FavScreen.dart';


class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {

  int _selectedIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const FavScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: _screens[_selectedIndex],

      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: Colors.transparent,
        color: AppColors.darkerRed,
        buttonBackgroundColor: AppColors.primaryRed,
        height: 65.h,
        animationDuration: const Duration(milliseconds: 300),

        items: [
          CurvedNavigationBarItem(
            child: Icon(
              Icons.home_outlined,
              size: 26.sp,
              color: Colors.white,
            ),
            label: 'الرئيسية',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'Cairo',
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(
              Icons.favorite_outline_outlined,
              size: 26.sp,
              color: Colors.white,
            ),
            label: 'المفضلة',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'Cairo',
            ),
          ),
        ],

        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}