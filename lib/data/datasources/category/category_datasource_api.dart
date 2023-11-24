import 'package:dio/dio.dart';
import 'package:online_shop/config/data.dart';
import 'package:online_shop/data/datasources/category/category_impl.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/services/httpRequest/httpRequestimpl.dart';

class CategoryRemoteDataSource implements CategoryInterFace {
  final HttpRequestInterFace httpRequest = ServiceLocator.get();

  @override
  Future<List<CategoryModel>> getCategory() async {
    Response categories = await httpRequest.get(Data.CategoryPath);
    List<CategoryModel> category = [];

    if (categories.statusCode == 200) {
      category = categories.data['items']
          .map<CategoryModel>(
              (categoryItems) => CategoryModel.fromMapJson(categoryItems))
          .toList();
      return category;
    }
    return [];
  }
}
