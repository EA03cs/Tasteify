import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Feature/Cart/ViewModel/Cubit/cart_cubit.dart';
import 'package:tasteify/Feature/Cart/ViewModel/Model/cartModel.dart';

class QuantityControls extends StatelessWidget {
  final CartItem item;

  const QuantityControls({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();
    final step = item.isWeighedProduct ? 0.25 : 1.0;

    return Row(
      children: [
        GestureDetector(
          onTap: () => cubit.removeCartItem(item.id),
          child: Container(
            width: 32.w,
            height: 32.h,
            decoration: BoxDecoration(
              color: CupertinoColors.systemRed.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Icon(
              CupertinoIcons.trash,
              size: 15.sp,
              color: CupertinoColors.systemRed,
            ),
          ),
        ),

        SizedBox(width: 8.w),

        Container(
          decoration: BoxDecoration(
            color: CupertinoColors.systemGrey6,
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  final newQty = item.quantity - step;
                  if (newQty >= item.minOrderQty) {
                    cubit.updateCartItem(item.id, newQty);
                  } else {
                    cubit.removeCartItem(item.id);
                  }
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColors.darkerRed,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(CupertinoIcons.minus,
                      size: 14.sp, color: Colors.white),
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  item.isWeighedProduct
                      ? item.quantity.toStringAsFixed(2)
                      : item.quantity.toInt().toString(),
                  style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              GestureDetector(
                onTap: () {
                  final newQty = item.quantity + step;
                  if (newQty <= item.maxOrderQty) {
                    cubit.updateCartItem(item.id, newQty);
                  }
                },
                child: Container(
                  width: 30.w,
                  height: 30.h,
                  decoration: BoxDecoration(
                    color: AppColors.darkerRed,
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  child: Icon(CupertinoIcons.add,
                      size: 14.sp, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}