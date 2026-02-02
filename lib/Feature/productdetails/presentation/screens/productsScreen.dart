import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Core/widgets/SearchField.dart';
import 'package:tasteify/Core/widgets/custAppBaar.dart';
import 'package:tasteify/Core/widgets/ProductCard.dart';
import 'package:tasteify/Feature/Categories/ViewModel/Cubit/categories_cubit.dart';
import 'package:tasteify/Feature/productdetails/presentation/screens/ProductDetails.dart';
import 'package:tasteify/Feature/productdetails/viewmodel/cubit/products_cubit.dart';

class ProductsScreen extends StatefulWidget {
  final int categoryId;
  final String categoryName;

  const ProductsScreen({
    super.key,
    required this.categoryId,
    required this.categoryName,
  });

  @override
  State<ProductsScreen> createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  @override
  void initState() {
    super.initState();
    context.read<ProductsCubit>()
        .fetchCategoryProducts(widget.categoryId);
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: widget.categoryName),
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          children: [
            const SearchField(),
            SizedBox(height: 16.h),
            Expanded(
              child:BlocBuilder<ProductsCubit, ProductsState>(
                builder: (context, state) {
                  if (state is ProductsLoading) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: AppColors.primaryRed,
                      ),
                    );
                  } else if (state is ProductsSuccess) {
                    final products = state.products;

                    if (products.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_basket_outlined,
                              size: 80.sp,
                              color: Colors.grey,
                            ),
                            SizedBox(height: 16.h),
                            Text(
                              'لا توجد منتجات في هذه الفئة',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 0.79,
                        crossAxisSpacing: 12.w,
                        mainAxisSpacing: 12.h,
                      ),
                      itemCount: products.length,
                      itemBuilder: (context, index) {
                        final product = products[index];
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetailsScreen(categoryId: widget.categoryId, productId: product.id,)));
                          },
                          child: ProductCard(
                            imagePath: product.imageUrl,
                            productName: product.name,
                            price: '${product.finalPrice.toStringAsFixed(0)} جنيه',
                            discount: product.discountPercentage,
                            isWeighedProduct: product.isWeighedProduct,
                            unitSymbol: product.unitSymbol,
                            onAddPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text('تم إضافة ${product.name} للسلة'),
                                  duration: const Duration(seconds: 1),
                                  backgroundColor: AppColors.primaryRed,
                                ),
                              );
                            },
                            onFavoritePressed: () {
                              // Add to favorites logic
                            },
                          ),
                        );
                      },
                    );
                  } else if (state is ProductsFailure) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.error_outline,
                            size: 60.sp,
                            color: Colors.red,
                          ),
                          SizedBox(height: 16.h),
                          Text(
                            'حدث خطأ في تحميل المنتجات',
                            style: TextStyle(fontSize: 14.sp),
                          ),
                          SizedBox(height: 8.h),
                          Text(
                            state.error,
                            style: TextStyle(
                              fontSize: 12.sp,
                              color: Colors.grey,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 16.h),
                          ElevatedButton(
                            onPressed: () {
                              context
                                  .read<ProductsCubit>().fetchCategoryProducts(widget.categoryId);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primaryRed,
                              foregroundColor: Colors.white,
                            ),
                            child: const Text('إعادة المحاولة'),
                          ),
                        ],
                      ),
                    );
                  }
                  return const SizedBox();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}