import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:tasteify/Core/utils/appText.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Core/widgets/AppName.dart';
import 'package:tasteify/Core/widgets/SearchField.dart';
import 'package:tasteify/Core/widgets/productGrid.dart';
import 'package:tasteify/Feature/Categories/Presentation/Screens/CatScreen.dart';
import 'package:tasteify/Feature/Categories/ViewModel/cubit/categories_cubit.dart';
import 'package:tasteify/Feature/Home/presentation/Widgets/CatCard.dart';
import 'package:tasteify/Feature/Home/presentation/Widgets/PromoBanner.dart';
import 'package:tasteify/Feature/Notification/Presentation/Screens/NotificationView.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<CategoriesCubit>().FetchCat();
    });
  }

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
                  Spacer(),
                  AppName(),
                ],
              ),
              SearchField(),
              SizedBox(height: 10.h),
              PromoBanner(),
              Row(
                children: [
                  Text('الفئات', style: AppTextStyles.subtitleStyle),
                  Spacer(),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const CatScreen(),
                        ),
                      );
                    },
                    child: Text(
                      'عرض الكل',
                      style: AppTextStyles.bodyStyle.copyWith(
                        color: AppColors.primaryRed,
                      ),
                    ),
                  ),
                ],
              ),

              BlocBuilder<CategoriesCubit, CategoriesState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return SizedBox(
                      height: 150.h,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: AppColors.primaryRed,
                        ),
                      ),
                    );
                  } else if (state is CategoriesSuccess) {
                    final limitedCategories = state.categories.take(4).toList();

                    return SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        spacing: 3.w,
                        children: limitedCategories.map((category) {
                          return CategoryCard(
                            imagePath: category.imageUrl ?? 'assets/Frame 11075.png',
                            categoryName: category.name ?? '',
                            onTap: () {},
                          );
                        }).toList(),
                      ),
                    );
                  } else if (state is CategoriesFailure) {
                    return SizedBox(
                      height: 150.h,
                      child: Center(
                        child: Text(
                          'حدث خطأ في تحميل الفئات',
                          style: AppTextStyles.bodyStyle,
                        ),
                      ),
                    );
                  }

                  return SizedBox(height: 150.h);
                },
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
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        index: _selectedIndex,
        backgroundColor: Colors.transparent,
        color:AppColors.darkerRed,
        buttonBackgroundColor: AppColors.primaryRed,
        height: 65.h,
        animationDuration: Duration(milliseconds: 300),
        items: [
          CurvedNavigationBarItem(
            child: Icon(Icons.home_outlined, size: 26.sp, color: Colors.white),
            label: 'الرئيسية',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'Cairo',
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.category_outlined, size: 26.sp, color: Colors.white),
            label: 'الفئات',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'Cairo',
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.shopping_cart_outlined, size: 26.sp, color: Colors.white),
            label: 'السلة',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'Cairo',
            ),
          ),
          CurvedNavigationBarItem(
            child: Icon(Icons.person_outline, size: 26.sp, color: Colors.white),
            label: 'الحساب',
            labelStyle: TextStyle(
              color: Colors.white,
              fontSize: 12.sp,
              fontFamily: 'Cairo',
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}