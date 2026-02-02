import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tasteify/Feature/Categories/ViewModel/model/CategoryWithProducts.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit() : super(ProductsInitial());

  Future<void> fetchCategoryProducts(int categoryId) async {
    emit(ProductsLoading());

    try {
      final response = await Dio().get(
        'https://tastebox.runasp.net/api/v1/categories/$categoryId',
      );

      if (response.statusCode == 200) {
        final data = CategoryWithProducts.fromJson(response.data);
        emit(ProductsSuccess(data.products));
      } else {
        emit(ProductsFailure('فشل في تحميل المنتجات'));
      }
    } catch (e) {
      emit(ProductsFailure(e.toString()));
    }
  }
}
