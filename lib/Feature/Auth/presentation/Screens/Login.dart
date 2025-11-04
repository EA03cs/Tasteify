import 'package:flutter/material.dart';
import '../../../../Core/utils/colors.dart';
import '../widgets/Header.dart';
import '../widgets/LoginForm.dart';


class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryRed,
      body: Column(
        children: [
          const Header(title: 'تسجيل الدخول', subtitle: 'سعداء بعودتك! يرجى تسجيل الدخول للمتابعة إلى حسابك والاستفادة من جميع خدماتنا.',),
          const Expanded(child: LoginForm()),
        ],
      ),
    );
  }
}
