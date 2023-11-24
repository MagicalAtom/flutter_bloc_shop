import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget {
  AppBarWidget({super.key, required this.child});
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 26, vertical: 20),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: 56,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [Image.asset('assets/images/icon_apple_blue.png'),child],
        ),
      ),
    );
  }
}
