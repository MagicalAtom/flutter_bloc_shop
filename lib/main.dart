import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/screens/home_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initial Service
  await initServiceLocator();

  runApp(FirstScreen());
}

class FirstScreen extends StatelessWidget {
  FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: ColorConfig.white,
      ),
      debugShowCheckedModeBanner: false,
      home: const Home(),
    );
  }
}
