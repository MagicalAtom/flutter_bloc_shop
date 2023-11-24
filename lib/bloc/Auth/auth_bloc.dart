import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:online_shop/config/data.dart';
import 'package:online_shop/data/repositories/auth/authentication_impl.dart';
import 'package:online_shop/di/di_shop.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthenticationRepositoryInterFace auth = ServiceLocator.get();



  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequest>((event, emit) async {
      emit(AuthStateLogin()); // این برای لودینگ موقع لاگین
      Either<String,String> authResponse  = await  auth.login(event.username, event.password,Data.loginPath); // حالا با استفاده از ریپازیتوری لاگین رو انجام میدیم
      // ریپازیتوری مشخص کننده اینه که دیتا از کجا بیاد
      emit(AuthResponse(response: authResponse));


    });


  }
}
