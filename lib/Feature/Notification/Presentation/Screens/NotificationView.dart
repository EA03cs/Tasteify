import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/widgets/custAppBaar.dart';
import 'package:tasteify/Feature/Notification/Presentation/Widgets/NotificationItem.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'الإشعارات',
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            const NotificationItem(
              image: "assets/donut with pink glaze.png",
              title: 'عرض جديد في المتجر!',
              description: 'تم إضافة أصناف جديدة إلى المتجر. تحقق منها الآن!',
              time: '2 دقيقة',
            ),
            const NotificationItem(
              image: "assets/donut with pink glaze.png",
              title: 'طلب جديد',
              description: 'لديك طلب جديد بانتظار الموافقة',
              time: '5 دقائق',
            ),
            const NotificationItem(
              image: "assets/donut with pink glaze.png",
              title: 'تم تأكيد الطلب',
              description: 'تم تأكيد طلبك وسيتم توصيله قريباً',
              time: '10 دقائق',
            ),
          ],
        ),
      ),
    );
  }
}