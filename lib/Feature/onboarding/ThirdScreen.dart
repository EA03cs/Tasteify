import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Core/utils/appText.dart';

class ThirdScreen extends StatelessWidget {
  const ThirdScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset('assets/Vector (2).png'),
              Positioned(
                top: 190.h,
                left: 40.w,
                child: Image.asset(
                  'assets/rafiki.png',
                  height: 300.h,
                  width: 300.w,
                ),
              ),
            ],
          ),
          SizedBox(height: 80.h),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              style: AppTextStyles.smallTitleStyle,
              children: [
                TextSpan(text: 'ابحث وتسوق '),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              'رحلتك مع الطعم تبدأ من هنا , نقدم لك اجود الخامات ',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyStyle,
            ),
          ),
        ],
      ),
    );
  }
}