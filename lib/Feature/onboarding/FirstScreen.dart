import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';

import '../../Core/utils/appText.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset('assets/Vector.png'),
              Positioned(
                top: 190.h,
                left: 40.w,
                child: Image.asset(
                  'assets/bro.png',
                  height: 300.h,
                  width: 300.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 60.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyles.titleStyle,
              children: [
                TextSpan(text: 'مرحباً بك في '),
                TextSpan(
                  text: 'Taste',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: 'Box',
                  style: TextStyle(
                    color: AppColors.primaryRed,
                  ),
                ),
                TextSpan(text: ' '),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              ' افتح الصندوق .. واكتشف طعم جديد كل يوم',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyStyle,
            ),
          ),
        ],
      ),
    );
  }
}