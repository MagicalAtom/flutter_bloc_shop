import 'package:flutter/material.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';
import 'package:online_shop/widgets/height_space_widget.dart';

class CategoryItem extends StatelessWidget {
  CategoryItem(
      {super.key,
      required this.text,
      required this.color,
      required this.child,
      required this.textStyle,
      });
  String text;
  Color color;
  Widget child;
  /// one (FontFamily) two (FontSize) three (TextColor) four (FontWeight) like ['Roboto',14,Colors.red,FontWeight.w500]
  List textStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: AlignmentDirectional.center,
            children: [
              Container(
                height: 58,
                width: 58,
                decoration: ShapeDecoration(
                  color: color,
                  shape: ContinuousRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  shadows: [
                    BoxShadow(
                      color: color,
                      blurRadius: 30,
                      spreadRadius: -10,
                      offset: const Offset(0, 13),
                    )
                  ],
                ),
              ),
              Positioned(child: child)
            ],
          ),
          Height(size: 12),
          CustomText(
          text: text,
          fontFamily: textStyle[0],
          fontSize: textStyle[1].toDouble(),
          color: textStyle[2],
          fontWeight: textStyle[3],
        ),
      ],
    );
  }
}
