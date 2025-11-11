import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasteify/Core/utils/appText.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Feature/Home/presentation/Screens/Home.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return const HomeScreen();
          }));
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primaryRed,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          padding: EdgeInsets.symmetric(vertical: 14.h),
          elevation: 0,
        ),
        child: Text(
          'تسجيل',
          style: AppTextStyles.bodyStyle.copyWith(
            color: AppColors.white,
            fontSize: 16.sp,
          ),
        ),
      ),
    );
  }
}