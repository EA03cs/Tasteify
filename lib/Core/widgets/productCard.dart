import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;
  final String? discount;
  final bool isWeighedProduct;
  final String unitSymbol;
  final VoidCallback? onAddPressed;
  final VoidCallback? onFavoritePressed;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.price,
    this.discount,
    this.isWeighedProduct = false,
    this.unitSymbol = '',
    this.onAddPressed,
    this.onFavoritePressed,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(
          color: CupertinoColors.systemGrey5,
          width: 1,
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Stack(
            children: [
              Container(
                height: 100.h,
                decoration: BoxDecoration(
                  color: CupertinoColors.systemGrey6.withOpacity(0.5),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12.r),
                    topRight: Radius.circular(12.r),
                  ),
                  child: Image.network(
                    imagePath,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Center(
                        child: Icon(
                          CupertinoIcons.photo,
                          size: 30.sp,
                          color: CupertinoColors.systemGrey3,
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Center(
                        child: CupertinoActivityIndicator(
                          radius: 10.r,
                        ),
                      );
                    },
                  ),
                ),
              ),

              if (discount != null && discount!.isNotEmpty)
                Positioned(
                  top: 6.h,
                  left: 6.w,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                    decoration: BoxDecoration(
                      color:AppColors.darkerRed.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.tag_fill,
                          size: 10.sp,
                          color: CupertinoColors.white,
                        ),
                        SizedBox(width: 3.w),
                        Text(
                          discount!,
                          style: TextStyle(
                            fontSize: 10.sp,
                            fontWeight: FontWeight.bold,
                            color: CupertinoColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

              Positioned(
                top: 6.h,
                right: 6.w,
                child: GestureDetector(
                  onTap: onFavoritePressed,
                  child: Container(
                    width: 28.w,
                    height: 28.h,
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isFavorite
                          ? CupertinoIcons.heart_fill
                          : CupertinoIcons.heart,
                      size: 14.sp,
                      color: isFavorite
                          ? const Color(0xFFB91C1C)
                          : CupertinoColors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),

          Padding(
            padding: EdgeInsets.all(8.w),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: CupertinoColors.black,
                    height: 1.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),

                SizedBox(height: 6.h),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          RichText(
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            text: TextSpan(
                              children: [
                                TextSpan(
                                  text: price,
                                  style: TextStyle(
                                    fontSize: 13.sp,
                                    fontWeight: FontWeight.bold,
                                    color:AppColors.darkerRed.withOpacity(0.8),

                                    fontFamily: 'Cairo',
                                  ),
                                ),
                                if (isWeighedProduct && unitSymbol.isNotEmpty)
                                  TextSpan(
                                    text: ' / $unitSymbol',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.normal,
                                      color: CupertinoColors.systemGrey,
                                      fontFamily: 'Cairo',
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    GestureDetector(
                      onTap: onAddPressed,
                      child: Container(
                        width: 32.w,
                        height: 32.h,
                        decoration: BoxDecoration(
                          color:AppColors.darkerRed.withOpacity(0.8),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          CupertinoIcons.add,
                          size: 18.sp,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}