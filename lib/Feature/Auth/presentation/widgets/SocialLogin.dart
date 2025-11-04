import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/appText.dart';
import '../../../../Core/utils/colors.dart';

class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color iconColor;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.text,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: AppColors.greyBorder, width: 1),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          backgroundColor: AppColors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: iconColor, size: 24.sp),
            SizedBox(width: 10.w),
            Text(
              text,
              style: AppTextStyles.bodyStyle.copyWith(
                fontSize: 14.sp,
                fontWeight: FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
