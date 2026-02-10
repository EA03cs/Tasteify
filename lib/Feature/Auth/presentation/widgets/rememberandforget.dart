import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';

class RememberAndForgotRow extends StatelessWidget {
  const RememberAndForgotRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ForgotPasswordButton(),
      ],
    );
  }
}


class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        minimumSize: Size(0, 0),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        'هل نسيت كلمة المرور؟',
        style: TextStyle(
          color: AppColors.primaryRed,
          fontWeight: FontWeight.bold,
          fontSize: 13.sp,
          fontFamily: 'Cairo',
        ),
      ),
    );
  }
}