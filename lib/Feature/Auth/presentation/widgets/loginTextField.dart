import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/appText.dart';
import 'package:tasteify/Core/utils/colors.dart';

class LoginTextField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final bool obscure;

  const LoginTextField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppTextStyles.bodyStyle.copyWith(fontSize: 15.sp),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          textAlign: TextAlign.right,
          obscureText: obscure,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: AppColors.lightGreyText,
              fontSize: 13.sp,
              fontFamily: 'Cairo',
            ),
            filled: true,
            fillColor: AppColors.offWhite,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 18.w,
              vertical: 14.h,
            ),
          ),
        ),
      ],
    );
  }
}