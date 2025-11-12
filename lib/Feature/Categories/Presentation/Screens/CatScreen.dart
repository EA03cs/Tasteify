import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/widgets/SearchField.dart';
import 'package:tasteify/Core/widgets/custAppBaar.dart';
import 'package:tasteify/Feature/Categories/Presentation/Widgets/CatItem.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الفئات'),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            const SearchField(),
            SizedBox(height: 16.h),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.2.w / 1.h,
                  crossAxisSpacing: 16.w,
                  mainAxisSpacing: 16.h,
                ),
                itemCount: 8,
                itemBuilder: (context, index) {
                  return CategoryItem(
                    image: 'assets/donut with pink glaze.png',
                    title: getCategoryName(index),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  String getCategoryName(int index) {
    final categories = [
      'الفواكه والخضراوات',
      'المخبوزات',
      'اللحوم',
      'الألبان',
      'المشروبات',
      'الحلويات',
      'البقوليات',
      'التوابل',
    ];
    return categories[index % categories.length];
  }
}