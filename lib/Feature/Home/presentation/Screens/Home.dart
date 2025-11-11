import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/appText.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Core/widgets/AppName.dart';
import 'package:tasteify/Core/widgets/SearchField.dart';
import 'package:tasteify/Core/widgets/productGrid.dart';
import 'package:tasteify/Feature/Home/presentation/Widgets/CatCard.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.notifications_none_outlined, size: 30.sp),
                  Spacer(),
                  AppName(),
                ],
              ),
              SearchField(),
              SizedBox(height: 10.h),
              Image.asset('assets/Component 2.png'),
              Row(
                children: [
                  Text('الفئات', style: AppTextStyles.subtitleStyle),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'عرض الكل',
                      style: AppTextStyles.bodyStyle.copyWith(
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 3.w,
                  children: [
                    CategoryCard(
                      imagePath: 'assets/Frame 11075 (3).png',
                      categoryName: 'الأطباق الرئيسية',
                    ),
                    CategoryCard(
                      imagePath: 'assets/Frame 11075 (2).png',
                      categoryName: 'الوجبات السريعة',
                    ),
                    CategoryCard(
                      imagePath: 'assets/Frame 11075 (1).png',
                      categoryName: 'الاطعمة الرئيسية',
                    ),
                    CategoryCard(
                      imagePath: 'assets/Frame 11075.png',
                      categoryName: 'الفواكة والخضراوات',
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text('الأكثر مبيعاً', style: AppTextStyles.subtitleStyle),
                  Spacer(),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'عرض الكل',
                      style: AppTextStyles.bodyStyle.copyWith(
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                ],
              ),
              ProductsGridView(),
            ],
          ),
        ),
      ),
    );
  }
}


