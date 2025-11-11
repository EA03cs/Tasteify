import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tasteify/Core/utils/appText.dart';
import 'package:tasteify/Core/utils/colors.dart';

class AppName extends StatelessWidget {
  const AppName({super.key});

  @override
  Widget build(BuildContext context) {
    return  RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        style: AppTextStyles.titleStyle,
        children: [
          TextSpan(
            text: 'Taste',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
          TextSpan(
            text: 'Box',
            style: TextStyle(
              color: AppColors.primaryRed,
            ),
          ),
          TextSpan(text: ' '),
        ],
      ),
    );
  }
}
