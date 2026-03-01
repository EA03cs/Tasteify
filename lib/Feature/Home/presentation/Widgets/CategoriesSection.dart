import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/appText.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Feature/Categories/Presentation/Screens/CatScreen.dart';
import 'package:tasteify/Feature/Categories/ViewModel/cubit/categories_cubit.dart';
import 'package:tasteify/Feature/Home/presentation/Widgets/CatCard.dart';
import 'package:tasteify/Feature/productdetails/presentation/screens/productsScreen.dart';

class CategoriesSection extends StatelessWidget {
  const CategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildHeader(context),
        SizedBox(height: 10.h),
        _buildCategoriesList(),
      ],
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        Text('الفئات', style: AppTextStyles.subtitleStyle),
        const Spacer(),
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
    );
  }

  Widget _buildCategoriesList() {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesLoading) {
          return _buildLoadingState();
        } else if (state is CategoriesSuccess) {
          return _buildSuccessState(state,context);
        } else if (state is CategoriesFailure) {
          return _buildErrorState();
        }
        return const SizedBox();
      },
    );
  }

  Widget _buildLoadingState() {
    return SizedBox(
      height: 150.h,
      child: Center(
        child: CircularProgressIndicator(
          color: AppColors.primaryRed,
        ),
      ),
    );
  }

  Widget _buildSuccessState(CategoriesSuccess state , BuildContext context) {
    final limitedCategories = state.categories.take(4).toList();

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        spacing: 3.w,
        children: limitedCategories.map((category) {
          return CategoryCard(
            imagePath: category.imageUrl,
            categoryName: category.name,
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=> ProductsScreen(categoryId: category.id, categoryName: category.name ) ));
            },
          );
        }).toList(),
      ),
    );
  }

  Widget _buildErrorState() {
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
}