import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../Core/utils/appText.dart';
import '../../../../Core/utils/colors.dart';

class RegisterNowText extends StatelessWidget {
  const RegisterNowText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.center,
        children: [
          Text(
            'ليس لديك حساب ؟ ',
            style: AppTextStyles.bodyStyle.copyWith(
              fontSize: 13.sp,
              fontWeight: FontWeight.normal,
            ),
          ),
          GestureDetector(
            onTap: () {

            },
            child: Text(
              'أنشئ حسابك الآن',
              style: AppTextStyles.bodyStyle.copyWith(
                color: AppColors.primaryRed,
                fontSize: 13.sp,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
