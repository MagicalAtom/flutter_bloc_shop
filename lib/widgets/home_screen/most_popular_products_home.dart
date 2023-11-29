
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/Product/product_bloc.dart';
import 'package:online_shop/data/models/Product.dart';
import 'package:online_shop/screens/product_detail.dart';
import 'package:online_shop/widgets/product_box_widget.dart';

import '../../helper/helper.dart';

class MostPopularProducts extends StatelessWidget {
  MostPopularProducts({super.key, required this.products});
  List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: SizedBox(
          height: 245,
          child: ListView.builder(
            reverse: true,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: (){
                  Navigator.push(context,MaterialPageRoute(builder: (BuildContext context){
                    return BlocProvider(
                      create: (context) => ProductBloc(),
                      // اینجا آیدی یونیک هر محصول که از صفحه هوم به طور تک به تک و با استفاده از لیست ویو ارسال شده بود به این صفحه رو میفرستیم به صفحه جزئیات محصول تا باهاش تمام موارد مربوط به محصول رو از اندپوینت های دیگه بگیریم
                      child: ProductDetailScreen(product: products[index]),
                    );
                   
                  }));
                },
                child: ProductBox(
                    productImage: Helper.getFilePath(
                        collectionId: products[index].collectionId,
                        recordId: products[index].id,
                        filename: products[index].thumbnail),
                    discount: [
                      true,
                      products[index].realPrice,
                      Helper.discountPricePercent(
                              price: products[index].price,
                              realPrice: products[index].realPrice)
                          .round(),
                    ],
                    price: products[index].price.toString(),
                    title: products[index].name),
              );
            },
          ),
        ),
      ),
    );
  }
}