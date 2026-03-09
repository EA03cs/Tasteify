import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Feature/Cart/ViewModel/Cubit/cart_cubit.dart';
import 'package:tasteify/Feature/Cart/ViewModel/Model/cartModel.dart';

class CartSummary extends StatelessWidget {
  final CartModel cart;

  const CartSummary({super.key, required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: _buildDecoration(),
      child: Column(
        children: [
          _SummaryRow(
            label: 'عدد المنتجات:',
            value: '${cart.itemsCount}',
          ),
          SizedBox(height: 6.h),
          _TotalRow(totalAmount: cart.totalAmount),
          SizedBox(height: 12.h),
          _ActionButtons(cart: cart),
        ],
      ),
    );
  }

  BoxDecoration _buildDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          offset: const Offset(0, -2),
        ),
      ],
    );
  }
}

class _SummaryRow extends StatelessWidget {
  final String label;
  final String value;

  const _SummaryRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14.sp, color: CupertinoColors.systemGrey),
        ),
        Text(
          value,
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class _TotalRow extends StatelessWidget {
  final double totalAmount;

  const _TotalRow({required this.totalAmount});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'الإجمالي:',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          '${totalAmount.toStringAsFixed(2)} ج.م',
          style: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.darkerRed,
          ),
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final CartModel cart;

  const _ActionButtons({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _ClearCartButton(),
        SizedBox(width: 10.w),
        _CheckoutButton(),
      ],
    );
  }
}

class _ClearCartButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<CartCubit>().clearCart(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
        decoration: BoxDecoration(
          border: Border.all(color: CupertinoColors.systemRed),
          borderRadius: BorderRadius.circular(12.r),
        ),
        child: Icon(
          CupertinoIcons.trash,
          color: CupertinoColors.systemRed,
          size: 20.sp,
        ),
      ),
    );
  }
}

class _CheckoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
        },
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 14.h),
          decoration: BoxDecoration(
            color: AppColors.darkerRed,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Center(
            child: Text(
              'تأكيد الطلب',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}