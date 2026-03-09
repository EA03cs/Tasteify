import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/utils/colors.dart';
import 'package:tasteify/Core/widgets/custAppBaar.dart';
import 'package:tasteify/Feature/Cart/ViewModel/Cubit/cart_cubit.dart';
import 'package:tasteify/Feature/Cart/ViewModel/Model/cartModel.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: CustomAppBar(title: "السلة", showBackButton: false),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {

            if (state is CartLoading) {
              return const Center(child: CupertinoActivityIndicator());
            }

            if (state is CartFailure) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(CupertinoIcons.exclamationmark_circle,
                        size: 48.sp, color: CupertinoColors.systemGrey),
                    SizedBox(height: 12.h),
                    Text(state.errorMessage, textAlign: TextAlign.center),
                    CupertinoButton(
                      onPressed: () => context.read<CartCubit>().getCart(),
                      child: const Text("حاول تاني"),
                    ),
                  ],
                ),
              );
            }

            if (state is CartLoaded) {
              final cart = state.cart;

              if (cart.items.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(CupertinoIcons.cart,
                          size: 64.sp, color: CupertinoColors.systemGrey3),
                      SizedBox(height: 16.h),
                      Text(
                        "السلة فاضية",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: CupertinoColors.systemGrey),
                      ),
                    ],
                  ),
                );
              }

              return Column(
                children: [
                  Expanded(
                    child: ListView.separated(
                      padding: EdgeInsets.all(12.w),
                      itemCount: cart.items.length,
                      separatorBuilder: (_, __) => SizedBox(height: 10.h),
                      itemBuilder: (context, index) {
                        final CartItem item = cart.items[index];
                        return _CartItemCard(item: item);
                      },
                    ),
                  ),

                  _CartSummary(cart: cart),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _CartItemCard extends StatelessWidget {
  final CartItem item;

  const _CartItemCard({required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: CupertinoColors.systemGrey5),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: Image.network(
              item.productImage,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => Icon(
                CupertinoIcons.photo,
                size: 30.sp,
                color: CupertinoColors.systemGrey3,
              ),
            ),
          ),

          SizedBox(width: 10.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.productName,
                  style: TextStyle(
                      fontSize: 14.sp, fontWeight: FontWeight.bold),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 4.h),
                Text(
                  '${item.finalPrice.toStringAsFixed(2)} ج.م / ${item.unitSymbol}',
                  style: TextStyle(
                      fontSize: 12.sp,
                      color: AppColors.darkerRed.withOpacity(0.8)),
                ),
                SizedBox(height: 4.h),
                Text(
                  'الإجمالي: ${item.subtotal.toStringAsFixed(2)} ج.م',
                  style: TextStyle(
                      fontSize: 12.sp, color: CupertinoColors.systemGrey),
                ),
              ],
            ),
          ),

          _QuantityControls(item: item),
        ],
      ),
    );
  }
}

class _QuantityControls extends StatelessWidget {
  final CartItem item;

  const _QuantityControls({required this.item});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartCubit>();

    return Column(
      children: [
        GestureDetector(
          onTap: () => cubit.removeCartItem(item.id),
          child: Icon(CupertinoIcons.trash,
              size: 18.sp, color: CupertinoColors.systemRed),
        ),
        SizedBox(height: 8.h),
        _CircleButton(
          icon: CupertinoIcons.add,
          onTap: () {
            final newQty = item.quantity + (item.isWeighedProduct ? 0.25 : 1);
            if (newQty <= item.maxOrderQty) {
              cubit.updateCartItem(item.id, newQty);
            }
          },
        ),
        SizedBox(height: 6.h),
        Text(
          item.isWeighedProduct
              ? item.quantity.toStringAsFixed(2)
              : item.quantity.toInt().toString(),
          style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 6.h),
        _CircleButton(
          icon: CupertinoIcons.minus,
          onTap: () {
            final newQty = item.quantity - (item.isWeighedProduct ? 0.25 : 1);
            if (newQty >= item.minOrderQty) {
              cubit.updateCartItem(item.id, newQty);
            } else {
              cubit.removeCartItem(item.id);
            }
          },
        ),
      ],
    );
  }
}

class _CircleButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _CircleButton({required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 28.w,
        height: 28.h,
        decoration: BoxDecoration(
          color: AppColors.darkerRed.withOpacity(0.8),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, size: 14.sp, color: Colors.white),
      ),
    );
  }
}

class _CartSummary extends StatelessWidget {
  final CartModel cart;

  const _CartSummary({required this.cart});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('عدد المنتجات:',
                  style: TextStyle(fontSize: 14.sp, color: CupertinoColors.systemGrey)),
              Text('${cart.itemsCount}',
                  style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold)),
            ],
          ),
          SizedBox(height: 6.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('الإجمالي:',
                  style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold)),
              Text(
                '${cart.totalAmount.toStringAsFixed(2)} ج.م',
                style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.darkerRed),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              GestureDetector(
                onTap: () => context.read<CartCubit>().clearCart(),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
                  decoration: BoxDecoration(
                    border: Border.all(color: CupertinoColors.systemRed),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Icon(CupertinoIcons.trash,
                      color: CupertinoColors.systemRed, size: 20.sp),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
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
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}