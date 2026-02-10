import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/appText.dart';
import 'package:tasteify/Feature/Auth/ViewModel/auth_cubit.dart';
import 'package:tasteify/Feature/Auth/presentation/widgets/loginButton.dart';
import 'package:tasteify/Feature/Auth/presentation/widgets/loginTextField.dart';
import 'package:tasteify/Feature/Auth/presentation/widgets/registerNow.dart';
import 'package:tasteify/Feature/Auth/presentation/widgets/rememberandforget.dart';
import 'package:tasteify/Feature/Home/presentation/Screens/Home.dart';
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
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is loginSuccess) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (_) => const HomeScreen()),
          );
        }

        if (state is loginError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.error)),
          );
        }
      },
      builder: (context, state) {
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

                  state is loginLoading
                      ? const Center(child: CircularProgressIndicator(
                    color: AppColors.primaryRed,
                  ))
                      : LoginButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().login(
                          _usernameController.text,
                          _passwordController.text,
                        );
                      }
                    },
                  ),

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
      },
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