part of 'auth_bloc.dart';

abstract class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthStateLogin extends AuthState {}

final class AuthResponse extends AuthState {
  Either<String,String> response;
  AuthResponse({required this.response});
}

