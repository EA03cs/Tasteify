import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CartLoadingWidget extends StatelessWidget {
  const CartLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CupertinoActivityIndicator(),
    );
  }
}

class CartErrorWidget extends StatelessWidget {
  final String errorMessage;
  final VoidCallback onRetry;

  const CartErrorWidget({
    super.key,
    required this.errorMessage,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.exclamationmark_circle,
            size: 48.sp,
            color: CupertinoColors.systemGrey,
          ),
          SizedBox(height: 12.h),
          Text(errorMessage, textAlign: TextAlign.center),
          CupertinoButton(
            onPressed: onRetry,
            child: const Text("حاول تاني"),
          ),
        ],
      ),
    );
  }
}

class CartEmptyWidget extends StatelessWidget {
  const CartEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            CupertinoIcons.cart,
            size: 64.sp,
            color: CupertinoColors.systemGrey3,
          ),
          SizedBox(height: 16.h),
          Text(
            "السلة فاضية",
            style: TextStyle(
              fontSize: 16.sp,
              color: CupertinoColors.systemGrey,
            ),
          ),
        ],
      ),
    );
  }
}