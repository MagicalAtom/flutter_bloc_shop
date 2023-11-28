import 'package:dio/dio.dart';
import 'package:online_shop/config/data.dart';
import 'package:online_shop/data/datasources/categoryProduct/category_product_data_source_impl.dart';
import 'package:online_shop/data/models/Product.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/services/httpRequest/httpRequest.dart';
import 'package:online_shop/services/httpRequest/httpRequestimpl.dart';

class CategoryProduct implements CategoryProductInterFace {
  final HttpRequestInterFace httpRequest = ServiceLocator.get();

  @override
  Future<List<Product>> getCategoryProduct(String category_id) async {
    Response response = await httpRequest.get(
        Data.ProductPath,
        httpRequest.setqueryParameters(
            filtername: 'category', filterValue: "$category_id"));

    List<Product> productsCategory = [];
    if (response.statusCode == 200) {
      productsCategory = response.data['items']
          .map<Product>((jsonObject) => Product.fromMapJson(jsonObject))
          .toList();
    }
    return productsCategory;
  }
}
