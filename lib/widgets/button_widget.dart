import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';

class Button extends StatelessWidget {
  Button({super.key,required this.text,required this.onPressed});
  String text;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
          backgroundColor: ColorConfig.main,
          shape: const StadiumBorder(),
          minimumSize: const Size(170, 60)),
      child: CustomText(
        text: text,
        fontFamily: 'SM',
        fontSize: 18,
        color: Colors.white,
      ),
    );
  }
}
