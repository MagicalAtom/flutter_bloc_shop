import 'package:dartz/dartz.dart';

abstract class  AuthenticationRepositoryInterFace{
Future<Either<String,String>> register(String username,String password,String passwordConfirm,String path);
Future<Either<String,String>> login(String username,String password,String path);





}