part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class loginSuccess extends AuthState {
  final LoginResponse loginResponse;
  loginSuccess({required this.loginResponse});
}
final class loginLoading extends AuthState {}
final class loginError extends AuthState {
  final String error;
  loginError({required this.error});
}

