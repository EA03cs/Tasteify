import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/appText.dart';

class CategoryCard extends StatelessWidget {
  final String imagePath;
  final String categoryName;
  final VoidCallback? onTap;

  const CategoryCard({
    super.key,
    required this.imagePath,
    required this.categoryName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            width: 110.w,
            height: 110.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: CupertinoColors.systemGrey.withOpacity(0.2),
                  blurRadius: 12,
                  offset: const Offset(0, 6),
                ),
              ],
            ),
            child: Container(
              padding: EdgeInsets.all(4.w),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    CupertinoColors.systemOrange.withOpacity(0.8),
                    CupertinoColors.systemRed.withOpacity(0.6),
                  ],
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: CupertinoColors.white,
                    width: 3,
                  ),
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 12.h),

          SizedBox(
            width: 110.w,
            child: Text(
              categoryName,
              style: AppTextStyles.bodyStyle.copyWith(
                fontSize: 13.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}