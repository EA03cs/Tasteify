part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class CartInitial extends CartState {}

final class CartLoading extends CartState {}

final class CartLoaded extends CartState {
  final CartModel cart;
  CartLoaded({required this.cart});
}

final class CartCountLoaded extends CartState {
  final int count;
  CartCountLoaded({required this.count});
}

final class CartFailure extends CartState {
  final String errorMessage;
  CartFailure({required this.errorMessage});
}