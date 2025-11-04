import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../../Core/utils/appText.dart';
import '../../Core/utils/colors.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Image.asset('assets/Vector (1).png'),
              Positioned(
                top: 190.h,
                left: 40.w,
                child: Image.asset(
                  'assets/amico.png',
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
              style: AppTextStyles.bodyStyle,
              children: [
                TextSpan(text: 'اكتشف تجربة تسوق فريدة مع '),
                TextSpan(
                  text: 'Taste',
                  style: AppTextStyles.subtitleStyle.copyWith(
                    color: AppColors.blackText,
                  ),
                ),
                TextSpan(
                  text: 'Box',
                  style: AppTextStyles.subtitleStyle.copyWith(
                    color: AppColors.primaryRed,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 40.w),
            child: Text(
              ' ستكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.',
              textAlign: TextAlign.center,
              style: AppTextStyles.bodyStyle,
            ),
          ),
        ],
      ),
    );
  }
}