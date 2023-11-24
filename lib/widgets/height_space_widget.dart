import 'package:flutter/material.dart';


class Height extends StatelessWidget {
   Height({super.key,required this.size});
  double size;
  @override
  Widget build(BuildContext context) {
    return SizedBox(height: size,);
  }
}