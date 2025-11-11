import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/appText.dart';

class ProductCard extends StatelessWidget {
  final String imagePath;
  final String productName;
  final String price;
  final String? discount;
  final VoidCallback? onAddPressed;
  final VoidCallback? onFavoritePressed;
  final bool isFavorite;

  const ProductCard({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.price,
    this.discount,
    this.onAddPressed,
    this.onFavoritePressed,
    this.isFavorite = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 220.w,
      decoration: BoxDecoration(
        color: CupertinoColors.white,
        borderRadius: BorderRadius.circular(24.r),
        boxShadow: [
          BoxShadow(
            color: CupertinoColors.systemGrey.withOpacity(0.15),
            blurRadius: 20,
            offset: const Offset(0, 8),
            spreadRadius: -5,
          ),
        ],
      ),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 56.h),

              Center(
                child: Container(
                  height: 120.h,
                  width: 120.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(imagePath),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 16.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: SizedBox(
                  height: 40.h,
                  child: Text(
                    productName,
                    style: AppTextStyles.subtitleStyle.copyWith(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),

              SizedBox(height: 8.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      price,
                      style: AppTextStyles.subtitleStyle.copyWith(
                        color: const Color(0xFFB91C1C),
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                      ),
                    ),


                    GestureDetector(
                      onTap: onAddPressed,
                      child: Container(
                        width: 36.w,
                        height: 36.h,
                        decoration: BoxDecoration(
                          color: const Color(0xFFB91C1C),
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFFB91C1C).withOpacity(0.4),
                              blurRadius: 12,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Icon(
                          CupertinoIcons.add,
                          size: 20.sp,
                          color: CupertinoColors.white,
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),

          if (discount != null)
            Positioned(
              top: 12.h,
              left: 12.w,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: const Color(0xFFFFC859),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16.r),
                    topRight: Radius.circular(16.r),
                    bottomRight: Radius.circular(16.r),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      CupertinoIcons.timer,
                      size: 16.sp,
                      color: CupertinoColors.black,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      discount!,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        color: CupertinoColors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ),

          Positioned(
            top: 12.h,
            right: 12.w,
            child: GestureDetector(
              onTap: onFavoritePressed,
              child: Container(
                width: 40.w,
                height: 40.h,
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.systemGrey.withOpacity(0.2),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(
                  isFavorite
                      ? CupertinoIcons.heart_fill
                      : CupertinoIcons.heart,
                  size: 22.sp,
                  color: isFavorite
                      ? CupertinoColors.systemRed
                      : CupertinoColors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}