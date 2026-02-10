import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Feature/Auth/ViewModel/auth_cubit.dart';
import 'package:tasteify/Feature/Auth/presentation/widgets/Header.dart';
import 'package:tasteify/Feature/Auth/presentation/widgets/LoginForm.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => AuthCubit(),
      child: Scaffold(
        backgroundColor: AppColors.primaryRed,
        body: Column(
          children: [
            const Header(
              title: 'تسجيل الدخول',
              subtitle: 'سعداء بعودتك! يرجى تسجيل الدخول للمتابعة إلى حسابك والاستفادة من جميع خدماتنا.',
            ),
            const Expanded(child: LoginForm()),
          ],
        ),
      ),
    );
  }
}
