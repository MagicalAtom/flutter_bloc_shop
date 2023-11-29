
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/Product/product_bloc.dart';
import 'package:online_shop/data/models/Product.dart';
import 'package:online_shop/screens/product_detail.dart';
import 'package:online_shop/widgets/product_box_widget.dart';

import '../../helper/helper.dart';
class mostSaleProducts extends StatelessWidget {
  mostSaleProducts({super.key, required this.BestSellerProduct});
  List<Product> BestSellerProduct;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SizedBox(
          height: 245,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: BestSellerProduct.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return ProductDetailScreen(product: BestSellerProduct[index],);
                    },
                  ));
                },
                child: ProductBox(
                  productImage: Helper.getFilePath(
                      collectionId: BestSellerProduct[index].collectionId,
                      recordId: BestSellerProduct[index].id,
                      filename: BestSellerProduct[index].thumbnail),
                  discount: [
                    true,
                    BestSellerProduct[index].realPrice,
                    Helper.discountPricePercent(
                        price: BestSellerProduct[index].price,
                        realPrice: BestSellerProduct[index].realPrice
                        
                        ).round(),
                  ],
                  price: BestSellerProduct[index].price.toString(),
                  title: BestSellerProduct[index].name)
              );
            },
          ),
        ),
      ),
    );
  }
}
