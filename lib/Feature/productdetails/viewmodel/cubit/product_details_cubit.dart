import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tasteify/Feature/Categories/ViewModel/model/CategoryWithProducts.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailInitial());
  Future<void> fetchProductDetails(int categoryId, int productId) async {
    emit(ProductDetailLoading());

    try {
      final response = await Dio().get(
        'https://tastebox.runasp.net/api/v1/categories/$categoryId/products/$productId',
        options: Options(
          headers: {
            'Accept': '*/*',
          },
        ),
      );

      if (response.statusCode == 200) {
        final product = Product.fromJson(response.data);
        emit(ProductDetailSuccess(product));
      } else {
        emit(ProductDetailFailure('فشل في تحميل تفاصيل المنتج'));
      }
    } catch (e) {
      emit(ProductDetailFailure(e.toString()));
    }
  }
}
