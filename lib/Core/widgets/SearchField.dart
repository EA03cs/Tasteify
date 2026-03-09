import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Feature/Search/presentation/Screen/SearchView.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const SearchView()),
      ),
      child: AbsorbPointer(
        child: TextFormField(
          style: TextStyle(
            fontSize: 16.sp,
            color: Color(0xffF6EFEF),
            fontFamily: 'Cairo',
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            suffixIcon: Icon(Icons.search_rounded, size: 30.sp),
            prefixIcon: Icon(Icons.mic_none_rounded, size: 26.sp),
            hintText: 'ابحث',
            filled: true,
            fillColor: AppColors.lightGreyText.withOpacity(0.2),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
              borderSide: BorderSide.none,
            ),
            hintStyle: TextStyle(fontSize: 16.sp, color: AppColors.greyText),
          ),
          textAlign: TextAlign.left,
        ),
      ),
    );
  }
}