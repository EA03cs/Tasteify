import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/appText.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    this.showBackButton = true,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      centerTitle: true,
      title: Stack(
        children: [
          Center(
            child: Text(
              title,
              style: AppTextStyles.titleStyle,
            ),
          ),
          if (showBackButton)
            Positioned(
              right: 0.w,
              top: 0.h,
              bottom: 0.h,
              child: GestureDetector(
                onTap: onBackPressed ?? () => Navigator.pop(context),
                child: Image.asset(
                  'assets/left 1.png',
                  width: 36.w,
                  height: 36.w,
                  fit: BoxFit.contain,
                ),
              ),
            ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.h);
}