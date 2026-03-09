import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Feature/Search/ViewModel/Cubit/search_cubit.dart';

class SearchBarField extends StatelessWidget {
  final TextEditingController controller;
  final SearchCubit cubit;

  const SearchBarField({
    super.key,
    required this.controller,
    required this.cubit,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: TextStyle(
        fontSize: 16.sp,
        color: Colors.black87,
        fontFamily: 'Cairo',
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        suffixIcon: GestureDetector(
          onTap: () => cubit.search(controller.text),
          child: Icon(Icons.search_rounded, size: 30.sp),
        ),
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
      textAlign: TextAlign.right,
      textInputAction: TextInputAction.search,
      onChanged: (value) => cubit.searchAsYouType(value),
      onFieldSubmitted: cubit.search,
    );
  }
}
