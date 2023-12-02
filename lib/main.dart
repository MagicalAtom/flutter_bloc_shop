import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/data/models/BasketItem.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/screens/home_screen.dart';
import 'package:online_shop/services/Hive/Hive.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await hive.init();
  hive.run<BasketItem>(BasketItemAdapter());
  await hive.make<BasketItem>('BasketBox');

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
