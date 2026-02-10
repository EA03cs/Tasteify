import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/appText.dart';
import 'package:tasteify/Feature/Auth/presentation/widgets/loginButton.dart';
import 'package:tasteify/Feature/Auth/presentation/widgets/loginTextField.dart';
import 'package:tasteify/Feature/Auth/presentation/widgets/registerNow.dart';
import 'package:tasteify/Feature/Auth/presentation/widgets/rememberandforget.dart';
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
              LoginTextField(
                controller: _usernameController,
                label: 'اسم المستخدم',
                hint: 'اكتب اسم المستخدم هنا',
              ),
              SizedBox(height: 18.h),
              LoginTextField(
                controller: _passwordController,
                label: 'كلمة المرور',
                hint: 'اكتب كلمة المرور هنا',
                obscure: true,
              ),
              RememberAndForgotRow(),
              SizedBox(height: 15.h),
              LoginButton(),
              SizedBox(height: 18.h),
              OrDivider(),
              SizedBox(height: 18.h),
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
}
class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
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