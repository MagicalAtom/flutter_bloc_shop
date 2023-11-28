import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  CustomText(
      {super.key,
      required this.text,
      this.color = Colors.black,
      this.fontFamily = '',
      this.fontSize = 15,
      this.fontWeight = FontWeight.w500,
      this.decoration = TextDecoration.none,
      this.decorationStyle = TextDecorationStyle.solid,
      this.overflowText = false,
      this.textAlign = TextAlign.right,
      });

  var text;
  Color color;
  double fontSize;
  String fontFamily;
  FontWeight fontWeight;
  TextDecoration decoration;
  TextDecorationStyle decorationStyle;
  bool overflowText;
  TextAlign textAlign;
  

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: overflowText ? 150 : null,
      child: Text(
        text,
        textAlign: textAlign,
        maxLines: overflowText ? 1 : null,
        style: TextStyle(
          color: color,
          fontFamily: fontFamily,
          fontSize: fontSize,
          fontWeight: fontWeight,
          decoration: decoration,
          decorationStyle: decorationStyle,
          overflow: overflowText ? TextOverflow.ellipsis : null
        ),
      ),
    );
  }
}
