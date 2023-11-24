import 'package:flutter/material.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/widgets/appbar_widget.dart';
import 'package:online_shop/widgets/product_box_widget.dart';


class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
             SliverToBoxAdapter(
                  child: AppBarWidget(
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'پرفروش ترین ها',
                            style: TextStyle(
                                color: ColorConfig.main,
                                fontFamily: 'SM',
                                fontSize: 19,
                                fontWeight: FontWeight.w600
                                ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                  SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 25),
                  sliver: SliverGrid(
                    delegate:SliverChildBuilderDelegate((context,index){
                      return ProductBox(
                            productImage: 'assets/images/iphone.png',
                            discount: [true, "11000000", "20"],
                            price: "12000000",
                            title: 'آیفون 13 پرومکس');
                    },childCount: 12),
                   gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 230,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 10,
                   ),
                   ),
                ),
          ],
        ),
      ),
    );
  }
}
