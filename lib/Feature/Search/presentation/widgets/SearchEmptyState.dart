import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchEmptyState extends StatelessWidget {
  final String? query;

  const SearchEmptyState({super.key, this.query});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(CupertinoIcons.search,
              size: 56.sp, color: CupertinoColors.systemGrey3),
          SizedBox(height: 12.h),
          Text(
            query != null ? 'مفيش نتايج لـ "$query"' : 'ابحث عن أي منتج',
            style:
            TextStyle(fontSize: 14.sp, color: CupertinoColors.systemGrey),
          ),
        ],
      ),
    );
  }
}