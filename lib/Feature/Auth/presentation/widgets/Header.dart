import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/appText.dart';
import '../../../../Core/utils/colors.dart';

class Header extends StatelessWidget {
  const Header({super.key, required this.title, required this.subtitle});
  final String title ;
  final String subtitle ;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.h,
      padding: EdgeInsets.symmetric(horizontal: 30.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 60.h),
          Text(
            title,
            style: AppTextStyles.titleStyle.copyWith(
              color: AppColors.white,
              fontSize: 26.sp,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            subtitle,
            style: AppTextStyles.bodyStyle.copyWith(
              color: AppColors.white,
              fontSize: 11.sp,
              fontWeight: FontWeight.normal,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
