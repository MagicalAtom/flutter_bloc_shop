import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/widgets/appbar_widget.dart';
import 'package:online_shop/widgets/category_item_widget.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';

class UserProfileScreen extends StatelessWidget {
  const UserProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: ColorConfig.white,

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 26),
          child: Column(
            children: [
              AppBarWidget(
                child: const Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'حساب کاربری',
                        style: TextStyle(
                            color: ColorConfig.main,
                            fontFamily: 'SM',
                            fontSize: 19,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'مهران پیل تن',
                        fontFamily: 'SM',
                        fontSize: 15,
                      ),
                      CustomText(
                        text: '09150092123',
                        fontFamily: 'SM',
                        fontSize: 15,
                      ),
                    ],
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Wrap(
                spacing: 15,
                runSpacing: 15,
                children: [
                  UserProfileScreenItems(
                      'همه', Icons.mouse_rounded, Colors.red),
                  UserProfileScreenItems(
                      'همه', Icons.mouse_rounded, Colors.red),
                  UserProfileScreenItems(
                      'همه', Icons.mouse_rounded, Colors.red),
                  UserProfileScreenItems(
                      'همه', Icons.mouse_rounded, Colors.red),
                  UserProfileScreenItems(
                      'همه', Icons.mouse_rounded, Colors.red),
                  UserProfileScreenItems(
                      'همه', Icons.mouse_rounded, Colors.red),
                  UserProfileScreenItems(
                      'همه', Icons.mouse_rounded, Colors.red),
                  UserProfileScreenItems(
                      'همه', Icons.mouse_rounded, Colors.red),
                  UserProfileScreenItems(
                      'همه', Icons.mouse_rounded, Colors.red),
                  UserProfileScreenItems(
                      'همه', Icons.mouse_rounded, Colors.red),
                ],
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      CustomText(
                        text: 'اپل شاپ',
                        fontFamily: 'SM',
                        fontSize: 14,
                        color: Colors.grey[600]!,
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: 'v 1.1',
                        fontFamily: 'SM',
                        fontSize: 13,
                        color: Colors.grey[600]!,

                      ),
                      SizedBox(
                        height: 5,
                      ),
                      CustomText(
                        text: 'CopyRight 2023',
                        fontFamily: 'SM',
                        fontSize: 12,
                        color: Colors.grey[600]!,

                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget UserProfileScreenItems(String text, IconData? icon, Color color) {
    return SizedBox(
      width: 58,
      child: CategoryItem(
        text: text,
        color: color,
        textStyle: const ['SM', 13, Colors.black, FontWeight.w500],
        child: Center(
          child: Icon(
            icon,
            size: 30,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
