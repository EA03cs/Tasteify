import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';

class CircleButton extends StatelessWidget {  // Note: no underscore prefix
  final IconData icon;
  final VoidCallback onTap;

  const CircleButton({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: AppColors.darkerRed.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 14.sp, color: Colors.white),
      ),
    );
  }
}