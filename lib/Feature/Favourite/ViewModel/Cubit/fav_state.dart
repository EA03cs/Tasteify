part of 'fav_cubit.dart';

@immutable
sealed class FavState {}

final class FavInitial extends FavState {}

final class FavLoading extends FavState {}

final class FavLoaded extends FavState {
  final List<FavProduct> favProduct;

  FavLoaded({required this.favProduct});

  FavLoaded copyWith({List<FavProduct>? favProduct}) =>
      FavLoaded(favProduct: favProduct ?? this.favProduct);

  List<Object?> get props => [favProduct];
}

final class FavCountLoaded extends FavState {
  final int count;

  FavCountLoaded({required this.count});

  List<Object?> get props => [count];
}

final class FavFailure extends FavState {
  final String errorMessage;

  FavFailure({required this.errorMessage});

  List<Object?> get props => [errorMessage];
}