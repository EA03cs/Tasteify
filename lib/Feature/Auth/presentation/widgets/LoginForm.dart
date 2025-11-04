import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Feature/Auth/presentation/widgets/registerNow.dart';
import '../../../../Core/utils/appText.dart';
import '../../../../Core/utils/colors.dart';
import 'SocialLogin.dart';


class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(100.r),
        ),
      ),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 25.w, vertical: 25.h),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextFieldLabel('اسم المستخدم'),
              _buildTextField(_usernameController, 'اكتب اسم المستخدم هنا'),
              SizedBox(height: 18.h),
              _buildTextFieldLabel('كلمة المرور'),
              _buildTextField(_passwordController, 'اكتب كلمة المرور هنا',
                  obscure: true),
              _buildRememberAndForgotRow(),
              SizedBox(height: 15.h),
              _buildLoginButton(),
              SizedBox(height: 18.h),
              _buildDivider(),
              SizedBox(height: 18.h),
              const SocialLoginButton(
                icon: Icons.facebook,
                text: 'تابع باستخدام فيسبوك',
                iconColor: Color(0xFF1877F2),
              ),
              SizedBox(height: 12.h),
              const SocialLoginButton(
                icon: Icons.g_mobiledata,
                text: 'تابع باستخدام جوجل',
                iconColor: Colors.red,
              ),
              SizedBox(height: 20.h),
              const RegisterNowText(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextFieldLabel(String label) {
    return Text(
      label,
      style: AppTextStyles.bodyStyle.copyWith(fontSize: 15.sp),
    );
  }

  Widget _buildTextField(TextEditingController controller, String hint,
      {bool obscure = false}) {
    return TextFormField(
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
    );
  }

  Widget _buildRememberAndForgotRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: false,
              onChanged: (value) {},
              activeColor: AppColors.primaryRed,
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              visualDensity: VisualDensity.compact,
            ),
            Text(
              'تذكرني',
              style: TextStyle(
                fontSize: 13.sp,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.bold,
                color: AppColors.greyText,
              ),
            ),
          ],
        ),
        TextButton(
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
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
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

  Widget _buildDivider() {
    return Center(
      child: Text(
        'او',
        style: AppTextStyles.bodyStyle.copyWith(
          fontSize: 13.sp,
          color: AppColors.greyText,
        ),
      ),
    );
  }
}
