import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/widgets/SearchField.dart';
import 'package:tasteify/Feature/Categories/ViewModel/cubit/categories_cubit.dart';
import 'package:tasteify/Feature/Home/presentation/Widgets/HomeHeader.dart';
import 'package:tasteify/Feature/Home/presentation/Widgets/PromoBanner.dart';
import 'package:tasteify/Feature/Home/presentation/Widgets/CategoriesSection.dart';
import 'package:tasteify/Feature/Home/presentation/Widgets/BestSellersSection.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
              const HomeHeader(),
              const SearchField(),
              SizedBox(height: 10.h),
              const PromoBanner(),
              const CategoriesSection(),
              const BestSellersSection(),
              SizedBox(height: 80.h),
            ],
          ),
        ),
      ),
    );
  }
}