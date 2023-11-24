import 'package:flutter/material.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';
import 'package:online_shop/widgets/width_space_widget.dart';

class TextIcon extends StatelessWidget {
  TextIcon({super.key, required this.text, required this.icon});
  CustomText text;
  Widget icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        Width(size: 8),
        text,
      ],
    );
  }
}
