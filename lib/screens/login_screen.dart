import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/Auth/auth_bloc.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/widgets/button_widget.dart';
import 'package:online_shop/widgets/custom_text_field_widget.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode textFieldUserName = FocusNode();
  FocusNode textFieldPassword = FocusNode();
  TextEditingController textFieldUserNamecontroller =
      TextEditingController(text: 'amirahmad');
  TextEditingController textFieldPasswordcontroller =
      TextEditingController(text: '12345678');

  @override
  void initState() {
    super.initState();
    textFieldUserName.addListener(() {
      setState(() {});
    });
    textFieldPassword.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    textFieldUserNamecontroller.dispose();
    textFieldPasswordcontroller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.main,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Container(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/icon_application.png',
                    width: 90,
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  CustomText(
                    text: 'اپل شاپ',
                    color: Colors.white,
                    fontFamily: 'SB',
                    fontSize: 22,
                  )
                ],
              )),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20)),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CustomTextField(
                          lable: 'نام کاربری',
                          controller: textFieldUserNamecontroller,
                          focusNode: textFieldUserName),
                      SizedBox(
                        height: 22,
                      ),
                      CustomTextField(
                          lable: 'کلمه عبور',
                          controller: textFieldPasswordcontroller,
                          focusNode: textFieldPassword),
                      const SizedBox(
                        height: 17,
                      ),
                      BlocBuilder<AuthBloc, AuthState>(
                        builder: (context, state) {
                          if (state is AuthInitial) {
                            // مرحله اول استیت . جایی که تازه قراره صفحه رو آماده کنه برای استیت . در اصل قراره ویجت رو آماده کنه برای استیت
                            return Button(
                                text: 'ورود به حساب کاربری',
                                onPressed: () {
                                  context.read<AuthBloc>().add(AuthLoginRequest(
                                      username:
                                          textFieldUserNamecontroller.text,
                                      password:
                                          textFieldPasswordcontroller.text));
                                });
                          } else if (state is AuthStateLogin) {
                            // وقتی که قراره لودینگ انجام بشه
                            return  CircularProgressIndicator.adaptive(
                            );
                          } else if (state is AuthResponse) {
                            // جواب لاگین که از سمت ریپازیتوری داده شده به بلاک
                            return state.response.fold(
                              (ErrorLogin) {
                                return Text(ErrorLogin);
                              },
                              (SuccessLogin) {
                                return Text(SuccessLogin);
                              },
                            );
                          }
                          return Text('Error');
                        },
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
