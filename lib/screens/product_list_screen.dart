import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/CategoryProduct/category_product_bloc.dart';
import 'package:online_shop/config/color.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/data/models/Product.dart';
import 'package:online_shop/extension/Navigator.dart';
import 'package:online_shop/helper/helper.dart';
import 'package:online_shop/widgets/appbar_widget.dart';
import 'package:online_shop/widgets/product_box_widget.dart';

class ProductListScreen extends StatefulWidget {
  ProductListScreen({super.key, required this.category});

  CategoryModel category;
  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  void initState() {
    super.initState();
    context
        .read<CategoryProductBloc>()
        .add(CategoryProductRequestEvent(category_id: widget.category.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConfig.white,
      body: BlocBuilder<CategoryProductBloc, CategoryProductState>(
        builder: (context, state) {
          return pageView(widget: widget, state: state);
        },
      ),
    );
  }
}

class pageView extends StatelessWidget {
  const pageView({
    super.key,
    required this.widget,
    required this.state,
  });

  final ProductListScreen widget;
  final state;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: AppBarWidget(
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.category.title,
                      style: const TextStyle(
                          color: ColorConfig.main,
                          fontFamily: 'SM',
                          fontSize: 19,
                          fontWeight: FontWeight.w600),
                    ),
                    GestureDetector(
                        onTap: () {
                          exitPage(context: context);
                        },
                        child: Image.asset('assets/images/back.png'))
                  ],
                ),
              ),
            ),
          ),
          state.getCategoryProduct.fold((faild) {
            return const SliverToBoxAdapter(
              child: Text('خطا داده های برنامه در دسترس نیست'),
            );
          }, (success) {
            return _generateProduct(
              products: success,
            );
          })
        ],
      ),
    );
  }
}

class _generateProduct extends StatelessWidget {
  _generateProduct({super.key, required this.products});
  List<Product> products;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      sliver: SliverGrid(
        delegate: SliverChildBuilderDelegate((context, index) {
          return ProductBox(
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
              title: products[index].name);
        }, childCount: products.length),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: 230,
          mainAxisSpacing: 20,
          crossAxisSpacing: 10,
        ),
      ),
    );
  }
}
