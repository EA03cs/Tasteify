import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tasteify/Core/cache/cache_helper.dart';
import 'package:tasteify/Core/utils/constant.dart';
import 'package:tasteify/Feature/Cart/ViewModel/Model/cartModel.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  final Dio _dio = Dio();
  final String _baseUrl = "${Constant.baseUrl}cart";

  Future<String?> _getToken() async {
    final token = await CacheHelper().getData(key: 'token');
    if (token == null) emit(CartFailure(errorMessage: 'Token not found'));
    return token;
  }

  Options _authOptions(String token) => Options(
    headers: {
      'Authorization': 'Bearer $token',
      'accept': '*/*',
      'Content-Type': 'application/json',
    },
  );

  Future<void> getCart() async {
    try {
      final token = await _getToken();
      if (token == null) return;

      emit(CartLoading());

      final response = await _dio.get(_baseUrl, options: _authOptions(token));

      if (response.statusCode == 200) {
        emit(CartLoaded(cart: CartModel.fromJson(response.data)));
      } else {
        emit(CartFailure(errorMessage: 'Error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addToCart(int productId, double quantity) async {
    try {
      final token = await _getToken();
      if (token == null) return;

      final response = await _dio.post(
        "$_baseUrl/items",
        data: {'productId': productId, 'quantity': quantity},
        options: _authOptions(token),
      );

      if (response.statusCode == 200) {
        emit(CartLoaded(cart: CartModel.fromJson(response.data)));
      } else {
        emit(CartFailure(errorMessage: 'Error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateCartItem(int itemId, double quantity) async {
    try {
      final token = await _getToken();
      if (token == null) return;

      final response = await _dio.put(
        "$_baseUrl/items/$itemId",
        data: {'quantity': quantity},
        options: _authOptions(token),
      );

      if (response.statusCode == 200) {
        emit(CartLoaded(cart: CartModel.fromJson(response.data)));
      } else {
        emit(CartFailure(errorMessage: 'Error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> removeCartItem(int itemId) async {
    try {
      final token = await _getToken();
      if (token == null) return;

      await _dio.delete("$_baseUrl/items/$itemId", options: _authOptions(token));

      await getCart();
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> clearCart() async {
    try {
      final token = await _getToken();
      if (token == null) return;

      await _dio.delete("$_baseUrl/clear", options: _authOptions(token));

      emit(CartLoaded(cart: CartModel.empty()));
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getCartCount() async {
    try {
      final token = await _getToken();
      if (token == null) return;

      final response = await _dio.get(
        "$_baseUrl/items/count",
        options: _authOptions(token),
      );

      if (response.statusCode == 200) {
        emit(CartCountLoaded(count: (response.data['count'] as num).toInt()));
      } else {
        emit(CartFailure(errorMessage: 'Error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(CartFailure(errorMessage: e.toString()));
    }
  }
}