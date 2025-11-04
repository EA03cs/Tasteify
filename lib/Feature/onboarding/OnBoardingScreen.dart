import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Feature/Auth/presentation/Screens/Login.dart';
import 'package:tasteify/Feature/onboarding/FirstScreen.dart';

import '../../Core/utils/appText.dart';
import '../../Core/utils/colors.dart';
import 'SecondScreen.dart';
import 'ThirdScreen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page) {
              setState(() {
                _currentPage = page;
              });
            },
            children: [
              FirstScreen(),
              SecondScreen(),
              ThirdScreen(),
            ],
          ),

          // Dots Indicator
          Positioned(
            bottom: 100.h,
            left: 0,
            right: 0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                3,
                    (index) => buildDot(index),
              ),
            ),
          ),

          Positioned(
            top: 50.h,
            left: 20.w,
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                );
              },
              child: Text(
                'تخطي',
                style: AppTextStyles.bodyStyle.copyWith(
                  color: AppColors.white,
                  fontSize: 16.sp,
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 30.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.w),
              child: ElevatedButton(
                onPressed: () {
                  if (_currentPage == 2) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  } else {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryRed,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  minimumSize: Size(double.infinity, 50.h),
                ),
                child: Text(
                  _currentPage == 2 ? 'ابدأ الآن' : 'التالي',
                  style: AppTextStyles.bodyStyle.copyWith(
                    color: AppColors.white,
                    fontSize: 18.sp,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: EdgeInsets.symmetric(horizontal: 4.w),
      height: 8.h,
      width: _currentPage == index ? 24.w : 8.w,
      decoration: BoxDecoration(
        color: _currentPage == index
            ? AppColors.primaryRed
            : AppColors.lightGreyText,
        borderRadius: BorderRadius.circular(4.r),
      ),
    );
  }
}