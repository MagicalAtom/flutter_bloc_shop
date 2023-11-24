import 'package:dio/dio.dart';
import 'package:online_shop/config/data.dart';
import 'package:online_shop/data/datasources/category/category_impl.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/services/httpRequest/httpRequestimpl.dart';

class CategoryDataSource implements CategoryInterFace {
  final HttpRequestInterFace httpRequest = ServiceLocator.get();
  
  @override
  Future<List<CategoryModel>> getCategory() {
    // TODO: implement getCategory
    throw UnimplementedError();
  }



}
