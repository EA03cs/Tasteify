import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasteify/Core/widgets/custAppBaar.dart';
import 'package:tasteify/Feature/Cart/Presentation/widgets/CartItemCard.dart';
import 'package:tasteify/Feature/Cart/Presentation/widgets/CartStateWidgets.dart';
import 'package:tasteify/Feature/Cart/Presentation/widgets/CartSummary.dart';
import 'package:tasteify/Feature/Cart/ViewModel/Cubit/cart_cubit.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CartCubit()..getCart(),
      child: Scaffold(
        appBar: CustomAppBar(title: "السلة", showBackButton: false),
        body: BlocBuilder<CartCubit, CartState>(
          builder: (context, state) {
            return _buildBody(context, state);
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, CartState state) {
    if (state is CartLoading) {
      return const CartLoadingWidget();
    }

    if (state is CartFailure) {
      return CartErrorWidget(
        errorMessage: state.errorMessage,
        onRetry: () => context.read<CartCubit>().getCart(),
      );
    }

    if (state is CartLoaded) {
      final cart = state.cart;

      if (cart.items.isEmpty) {
        return const CartEmptyWidget();
      }

      return Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.all(12.w),
              itemCount: cart.items.length,
              separatorBuilder: (_, __) => SizedBox(height: 10.h),
              itemBuilder: (context, index) {
                final item = cart.items[index];
                return CartItemCard(item: item);
              },
            ),
          ),
          CartSummary(cart: cart),
        ],
      );
    }

    return const SizedBox();
  }
}