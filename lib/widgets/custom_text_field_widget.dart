import 'package:flutter/material.dart';
import 'package:online_shop/widgets/custom_text_widget.dart';
import 'package:online_shop/config/color.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {super.key,
      required this.lable,
      required this.controller,
      required this.focusNode});
  FocusNode focusNode;
  TextEditingController controller;
  String lable;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: focusNode.hasFocus ? TextDirection.ltr : TextDirection.rtl,
      child: TextField(
        controller: controller,
        textDirection: TextDirection.ltr,
        focusNode: focusNode,
        decoration: InputDecoration(
            label: Directionality(
                textDirection: TextDirection.rtl,
                child: CustomText(
                  text: lable,
                  fontFamily: 'SM',
                  color:  focusNode.hasFocus ? ColorConfig.main : Colors.black,
                  fontSize: 19,
                  
                  fontWeight: FontWeight.w500,
                )),
              
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: Colors.black,
                  width: 3,
                )),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
                borderSide: const BorderSide(
                  color: ColorConfig.main,
                  width: 3,
                ))),
      ),
    );
  }
}
