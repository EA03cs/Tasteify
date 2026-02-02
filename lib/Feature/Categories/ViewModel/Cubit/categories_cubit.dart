import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tasteify/Feature/Categories/ViewModel/model/CategoryWithProducts.dart';
import 'package:tasteify/Feature/Categories/ViewModel/model/catModel.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit() : super(CategoriesInitial());

  Future<void> FetchCat() async {
    emit(CategoriesLoading());
    try {
      final response = await Dio().get(
        'https://tastebox.runasp.net/api/v1/categories',
        options: Options(
          headers: {
            'Accept': '*/*',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List list = response.data;

        final categories = list
            .map((e) => Category.fromJson(e))
            .toList();
        emit(CategoriesSuccess(categories));
      } else {
        emit(CategoriesFailure(error: 'فشل في تحميل الفئات'));
      }
    } catch (e) {
      emit(CategoriesFailure(error: e.toString()));
    }
  }

}