import 'package:dio/dio.dart';
import 'package:online_shop/config/data.dart';
import 'package:online_shop/data/datasources/product/product_data_source_impl.dart';
import 'package:online_shop/data/models/Product.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/services/httpRequest/httpRequestimpl.dart';

class ProductDataSource implements ProductInterFace {
  final HttpRequestInterFace httpRequest = ServiceLocator.get();

  @override
  Future<List<Product>> getProducts() async {
    Response response = await httpRequest.get(Data.ProductPath);
    List<Product> products = [];

    if (response.statusCode == 200) {
      products = response.data['items']
          .map<Product>((mapJson) => Product.fromMapJson(mapJson))
          .toList();
      return products;
    }
    return [];
  }

  @override
  Future<List<Product>> getHottestProducts() async {
    Response response = await httpRequest.get(Data.ProductPath,
        httpRequest.setqueryParameters(filtername:'popularity', filterValue:'Hotest'));
    List<Product> products = [];

    if(response.statusCode == 200){
    products =   response.data['items'].map<Product>((jsonMapObject)=>Product.fromMapJson(jsonMapObject)).toList();
      return products;
    }
  return [];
  }
  
  @override
  Future<List<Product>> getBestSellerProducts() async {

    Response response = await httpRequest.get(Data.CategoryPath,httpRequest.setqueryParameters(filtername:'popularity', filterValue:'Best Seller'));
    List<Product> BestSellerProduct = [];

    if (response.statusCode == 200) {
      BestSellerProduct = response.data['items'].map<Product>((jsonMapObject) => Product.fromMapJson(jsonMapObject)).toList();
      return BestSellerProduct;
    }
    return [];
  }
}
