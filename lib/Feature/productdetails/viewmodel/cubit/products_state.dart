part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

class ProductsInitial extends ProductsState {}

class ProductsLoading extends ProductsState {}

class ProductsSuccess extends ProductsState {
  final List<Product> products;
  ProductsSuccess(this.products);
}

class ProductsFailure extends ProductsState {
  final String error;
  ProductsFailure(this.error);
}
