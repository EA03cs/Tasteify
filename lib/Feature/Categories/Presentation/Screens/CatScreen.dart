import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Core/widgets/SearchField.dart';
import 'package:tasteify/Core/widgets/custAppBaar.dart';
import 'package:tasteify/Feature/Categories/Presentation/Widgets/CatItem.dart';
import 'package:tasteify/Feature/Categories/ViewModel/Cubit/categories_cubit.dart';
import 'package:tasteify/Feature/productdetails/presentation/screens/productsScreen.dart';

class CatScreen extends StatelessWidget {
  const CatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'الفئات'),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            const SearchField(),
            SizedBox(height: 16.h),
            Expanded(
              child: BlocProvider(
                create: (context) => CategoriesCubit()..FetchCat(),
                child: BlocBuilder<CategoriesCubit, CategoriesState>(
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
                    }
                    else if (state is CategoriesSuccess) {
                      final cat = state.categories;
                      return GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1.2.w / 1.h,
                          crossAxisSpacing: 16.w,
                          mainAxisSpacing: 16.h,
                        ),
                        itemCount: cat.length,
                        itemBuilder: (context, index) {
                          final category = state.categories[index];
                          return GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsScreen(name: category.name),));
                            },
                            child: CategoryItem(
                              image: category.imageUrl,
                              title: category.name,
                            ),
                          );
                        },
                      );
                    }
                    else if (state is CategoriesFailure) {
                      return Text(state.error);
                    }
                    return Text('');
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}