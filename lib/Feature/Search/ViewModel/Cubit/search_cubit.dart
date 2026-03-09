import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tasteify/Core/cache/cache_helper.dart';
import 'package:tasteify/Core/utils/constant.dart';
import 'package:tasteify/Feature/Categories/ViewModel/model/CategoryWithProducts.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchInitial());

  final Dio _dio = Dio();
  final List<String> _history = [];

  List<String> get history => List.unmodifiable(_history);

  Future<void> search(String query) async {
    if (query.trim().isEmpty) return;

    try {
      final token = await CacheHelper().getData(key: 'token');
      if (token == null) {
        emit(SearchFailure(errorMessage: 'Token not found'));
        return;
      }

      _history.remove(query);
      _history.insert(0, query);
      if (_history.length > 10) _history.removeLast();

      emit(SearchLoading());

      final response = await _dio.get(
        "${Constant.baseUrl}products/search",
        queryParameters: {'query': query},
        options: Options(headers: {
          'Authorization': 'Bearer $token',
          'accept': '*/*',
        }),
      );

      if (response.statusCode == 200 && response.data is List) {
        final products = (response.data as List)
            .map((item) => Product.fromJson(item))
            .toList();
        emit(SearchLoaded(products: products, query: query));
      } else {
        emit(SearchFailure(errorMessage: 'Error: ${response.statusCode}'));
      }
    } catch (e) {
      emit(SearchFailure(errorMessage: e.toString()));
    }
  }

  void removeFromHistory(String query) {
    _history.remove(query);
    emit(SearchInitial());
  }

  void clearHistory() {
    _history.clear();
    emit(SearchInitial());
  }
  Timer? _debounce;

  void searchAsYouType(String query) {
    if (query.trim().isEmpty) {
      emit(SearchInitial());
      return;
    }

    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 400), () {
      search(query);
    });
  }

  @override
  Future<void> close() {
    _debounce?.cancel();
    return super.close();
  }
}