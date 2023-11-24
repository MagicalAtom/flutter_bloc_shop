import 'package:flutter/material.dart';


class Width extends StatelessWidget {
   Width({super.key,required this.size});
  double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(width: size,);
  }
}