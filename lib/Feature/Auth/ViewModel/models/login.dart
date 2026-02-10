import 'dart:convert';

class LoginResponse {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String token;
  final int expiresIn;
  final String refreshToken;
  final DateTime refreshTokenExpiration;

  LoginResponse({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.token,
    required this.expiresIn,
    required this.refreshToken,
    required this.refreshTokenExpiration,
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      id: json['id'] as String,
      email: json['email'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      token: json['token'] as String,
      expiresIn: json['expiresIn'] as int,
      refreshToken: json['refreshToken'] as String,
      refreshTokenExpiration: DateTime.parse(json['refreshTokenExpiration'] as String),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'token': token,
      'expiresIn': expiresIn,
      'refreshToken': refreshToken,
      'refreshTokenExpiration': refreshTokenExpiration.toIso8601String(),
    };
  }

  static LoginResponse fromRawJson(String str) =>
      LoginResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  @override
  String toString() {
    return 'LoginResponse(id: $id, email: $email, name: $firstName $lastName, token: ${token.substring(0, 20)}..., expiresIn: $expiresIn)';
  }
}