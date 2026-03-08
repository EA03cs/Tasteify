import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/widgets/ProductCard.dart';
import 'package:tasteify/Core/widgets/custAppBaar.dart';
import 'package:tasteify/Feature/Favourite/ViewModel/Cubit/fav_cubit.dart';
import 'package:tasteify/Feature/Favourite/ViewModel/models/Favmodel.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => FavCubit()..getFav(),
      child: Scaffold(
        appBar: CustomAppBar(title: "المفضلة", showBackButton: false),
        body: BlocBuilder<FavCubit, FavState>(
          builder: (context, state) {
            if (state is FavLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (state is FavFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.exclamationmark_circle,
                        size: 48.sp, color: CupertinoColors.systemGrey),
                    SizedBox(height: 12.h),
                    Text(state.errorMessage,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14.sp)),
                    SizedBox(height: 12.h),
                    CupertinoButton(
                      onPressed: () => context.read<FavCubit>().getFav(),
                      child: const Text("حاول تاني"),
                    ),
                  ],
                ),
              );
            }

            if (state is FavLoaded) {
              if (state.favProduct.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.heart_slash,
                          size: 64.sp, color: CupertinoColors.systemGrey3),
                      SizedBox(height: 16.h),
                      Text(
                        "مفيش منتجات في المفضلة",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: CupertinoColors.systemGrey),
                      ),
                    ],
                  ),
                );
              }

              return Padding(
                padding: EdgeInsets.all(8.w),
                child: GridView.builder(
                  itemCount: state.favProduct.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.w,
                    mainAxisSpacing: 10.h,
                    childAspectRatio: 0.75,
                  ),
                  itemBuilder: (context, index) {
                    final FavProduct product = state.favProduct[index];
                    return GestureDetector(
                      onTap: () {
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) => ProductDetailsScreen(
                        //     productId: product.id,
                        //   ),
                        // ));
                      },
                      child: ProductCard(
                        imagePath: product.imageUrl,
                        productName: product.name,
                        price: '${product.finalPrice.toStringAsFixed(2)} ج.م',
                        discount: product.discountPercentage,
                        isWeighedProduct: product.isWeighedProduct,
                        unitSymbol: product.unitSymbol,
                        isFavorite: true,
                        onFavoritePressed: () =>
                            context.read<FavCubit>().removeFromFav(product.id),
                        onAddPressed: () {
                        },
                      ),
                    );
                  },
                ),
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}