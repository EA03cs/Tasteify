import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'package:tasteify/Core/cache/cache_helper.dart';
import 'package:tasteify/Feature/Auth/ViewModel/models/login.dart';
import 'package:tasteify/constant.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  Future<void> login (String username, String password) async {
    emit(loginLoading());
    try {
      var response = await Dio().post('${Constant.baseUrl}authentication/login',
          options: Options(
            headers: {
              'Content-Type': 'application/json',
              'Accept': '*/*',
            },
          ),
          data: {
        'email': username,
        'password': password,
      });
      if (response.statusCode == 200) {
        LoginResponse loginResponse = LoginResponse.fromJson(response.data);
        CacheHelper().saveData(key: 'token', value: loginResponse.token);
        CacheHelper().saveData(key: 'refreshToken', value: loginResponse.refreshToken);
        CacheHelper().saveData(key: 'refreshTokenExpiration', value: loginResponse.refreshTokenExpiration);
        CacheHelper().saveData(key: 'id', value: loginResponse.id);
        CacheHelper().saveData(key: 'email', value: loginResponse.email);
        CacheHelper().saveData(key: 'firstName', value: loginResponse.firstName);
        CacheHelper().saveData(key: 'lastName', value: loginResponse.lastName);
        emit(loginSuccess(loginResponse: loginResponse));
      }
    } catch (e) {
      emit(loginError(error: e.toString()));
    }
  }
}
