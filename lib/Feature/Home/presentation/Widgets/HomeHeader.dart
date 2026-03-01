import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/widgets/AppName.dart';
import 'package:tasteify/Feature/Notification/Presentation/Screens/NotificationView.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const NotificationView(),
              ),
            );
          },
          child: Icon(
            Icons.notifications_none_outlined,
            size: 30.sp,
          ),
        ),
        const Spacer(),
        const AppName(),
      ],
    );
  }
}