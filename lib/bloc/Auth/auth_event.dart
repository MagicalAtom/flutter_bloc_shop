part of 'auth_bloc.dart';

abstract class AuthEvent {}


final class AuthLoginRequest extends AuthEvent {  // وقتی این ایونت صدا زده شد این هارو میاره سمت بلاک و نتیجه هم که ایزر هست پر میشه داخل استیت برای نمایش
  String username;
  String password;
  AuthLoginRequest({required this.username,required this.password});
}