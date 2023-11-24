import 'package:online_shop/data/models/Category.dart';

abstract class CategoryInterFace {
Future<List<CategoryModel>> getCategory();
}