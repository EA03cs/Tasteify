part of 'product_details_cubit.dart';

@immutable
sealed class ProductDetailsState {}

class ProductDetailInitial extends ProductDetailsState {}

class ProductDetailLoading extends ProductDetailsState {}

class ProductDetailSuccess extends ProductDetailsState {
  final Product product;
  ProductDetailSuccess(this.product);
}

class ProductDetailFailure extends ProductDetailsState {
  final String error;
  ProductDetailFailure(this.error);
}