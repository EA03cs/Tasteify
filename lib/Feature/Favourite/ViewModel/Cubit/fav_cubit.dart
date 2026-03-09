import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tasteify/Core/cache/cache_helper.dart';
import 'package:tasteify/Core/utils/constant.dart';
import 'package:tasteify/Feature/Favourite/ViewModel/models/Favmodel.dart';

part 'fav_state.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit() : super(FavInitial());

  final Dio _dio = Dio();
  final String _baseUrl = "${Constant.baseUrl}favorites";

  Future<String?> _getToken() async {
    final token = await CacheHelper().getData(key: 'token');
    if (token == null) {
      emit(FavFailure(errorMessage: 'Token not found'));
    }
    return token;
  }

  Options _authOptions(String token) => Options(
    headers: {
      'Authorization': 'Bearer $token',
      'accept': '*/*',
    },
  );

  Future<void> getFav() async {
    try {
      final token = await _getToken();
      if (token == null) return;

      emit(FavLoading());

      final response = await _dio.get(
        _baseUrl,
        options: _authOptions(token),
      );

      if (response.statusCode == 200 && response.data is List) {
        final products = (response.data as List)
            .map((item) => FavProduct.fromJson(item))
            .toList();
        emit(FavLoaded(favProduct: products));
      } else {
        emit(FavFailure(errorMessage: 'Unexpected response format'));
      }
    } catch (e) {
      emit(FavFailure(errorMessage: e.toString()));
    }
  }

  Future<void> addToFav(int productId) async {
    try {
      final token = await _getToken();
      if (token == null) return;

      await _dio.post(
        "$_baseUrl/$productId",
        options: _authOptions(token),
      );

      await getFav();
    } catch (e) {
      emit(FavFailure(errorMessage: e.toString()));
    }
  }

  Future<void> removeFromFav(int productId) async {
    try {
      final token = await _getToken();
      if (token == null) return;

      await _dio.delete(
        "$_baseUrl/$productId",
        options: _authOptions(token),
      );

      await getFav();
    } catch (e) {
      emit(FavFailure(errorMessage: e.toString()));
    }
  }

  Future<void> clearFav() async {
    try {
      final token = await _getToken();
      if (token == null) return;

      await _dio.delete(
        "$_baseUrl/clear",
        options: _authOptions(token),
      );

      emit(FavLoaded(favProduct: []));
    } catch (e) {
      emit(FavFailure(errorMessage: e.toString()));
    }
  }

  Future<void> getFavCount() async {
    try {
      final token = await _getToken();
      if (token == null) return;

      final response = await _dio.get(
        "$_baseUrl/count",
        options: _authOptions(token),
      );

      if (response.statusCode == 200) {
        final count = response.data['count'] as int;
        emit(FavCountLoaded(count: count));
      } else {
        emit(FavFailure(errorMessage: 'Error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(FavFailure(errorMessage: e.toString()));
    }
  }
}