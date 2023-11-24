import 'package:online_shop/config/data.dart';
import 'package:online_shop/data/datasources/auth/authentication_impl.dart';
import 'package:online_shop/data/repositories/auth/authentication_impl.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:dartz/dartz.dart';
import 'package:online_shop/exception/HttpException.dart';
import 'package:online_shop/services/localStorage/localStorage.dart';

class AuthenticationRepository implements AuthenticationRepositoryInterFace {
  final AuthenticationInterFace auth = ServiceLocator.get(); // حالا اگه بخوایم مثلا ثبت نام دیگه نره به سمت ای پی آی و داخل خود گوشی کاربر ذخیره بشه فقط فایل دیتا سورسش رو میسازیم تو فایل دی آی شاپ تغییر میدیم و همین دیگه

  @override
  Future<Either<String, String>> register(String username,String password,String passwordConfirm,String path) async {
    try {
      await auth.register(username, password, passwordConfirm,
          path);
      return right('ثبت نام انجام شد');
    } on HttpExceptionHandle catch (e) {
      return left(e.message ?? 'خطا!');
    }
  }
  
  @override
  Future<Either<String, String>> login(String username, String password, String path) async {
    try {
     String AuthToken = await auth.login(username, password, path);
          if (AuthToken.isNotEmpty) {
            LocalStorage.set(Data.LoginTokenName,AuthToken);
          return right('ورود با موفقیت انجام شد');
        }else{
          return left('خطا در ورود به حساب');
        }
    }on HttpExceptionHandle catch(e){
      return left(e.message.toString());
    }
  }
}
