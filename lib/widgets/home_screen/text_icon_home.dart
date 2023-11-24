  import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';
import 'package:online_shop/widgets/text_icon_widget.dart';

Widget TextIconWidget() {
    return TextIcon(
      text: CustomText(
        text: 'مشاهده همه',
        fontFamily: 'SM',
        fontSize: 13,
        color: ColorConfig.main,
        fontWeight: FontWeight.w600,
      ),
      icon: Image.asset(
        'assets/images/icon_left_categroy.png',
        width: 22,
        height: 22,
        fit: BoxFit.cover,
      ),
    );
  }