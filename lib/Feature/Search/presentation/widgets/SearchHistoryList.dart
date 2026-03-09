import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Feature/Search/ViewModel/Cubit/search_cubit.dart';

class SearchHistoryList extends StatelessWidget {
  final SearchCubit cubit;
  final TextEditingController controller;

  const SearchHistoryList({
    super.key,
    required this.cubit,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _HistoryHeader(cubit: cubit),
        SizedBox(height: 8.h),
        Expanded(
          child: ListView.separated(
            itemCount: cubit.history.length,
            separatorBuilder: (_, __) =>
                Divider(height: 1, color: CupertinoColors.systemGrey5),
            itemBuilder: (context, index) {
              final query = cubit.history[index];
              return _HistoryItem(
                query: query,
                cubit: cubit,
                controller: controller,
              );
            },
          ),
        ),
      ],
    );
  }
}

class _HistoryHeader extends StatelessWidget {
  final SearchCubit cubit;

  const _HistoryHeader({required this.cubit});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('عمليات البحث الأخيرة',
            style:
            TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
        GestureDetector(
          onTap: cubit.clearHistory,
          child: Text('مسح الكل',
              style: TextStyle(
                  fontSize: 12.sp, color: CupertinoColors.systemRed)),
        ),
      ],
    );
  }
}

class _HistoryItem extends StatelessWidget {
  final String query;
  final SearchCubit cubit;
  final TextEditingController controller;

  const _HistoryItem({
    required this.query,
    required this.cubit,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.symmetric(horizontal: 4.w),
      leading: Icon(CupertinoIcons.clock,
          size: 18.sp, color: CupertinoColors.systemGrey),
      title: Text(query,
          style: TextStyle(fontSize: 14.sp, fontFamily: 'Cairo')),
      trailing: GestureDetector(
        onTap: () => cubit.removeFromHistory(query),
        child: Icon(CupertinoIcons.xmark,
            size: 14.sp, color: CupertinoColors.systemGrey),
      ),
      onTap: () {
        controller.text = query;
        cubit.search(query);
      },
    );
  }
}