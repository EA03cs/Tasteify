import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/appText.dart';
import 'package:tasteify/Core/utils/colors.dart';

class NotificationItem extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String time;

  const NotificationItem({
    super.key,
    required this.image,
    required this.title,
    required this.description,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 50.w,
              height: 50.h,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.subtitleStyle.copyWith(fontSize: 14.sp),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Text(
                    description,
                    style: AppTextStyles.bodyStyle.copyWith(
                      color: Colors.grey,
                      fontSize: 10.sp,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 5.h),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      time,
                      style: AppTextStyles.bodyStyle.copyWith(
                        fontSize: 10.sp,
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 5.h),
        Divider(color: Colors.grey, thickness: 1.h),
      ],
    );
  }
}