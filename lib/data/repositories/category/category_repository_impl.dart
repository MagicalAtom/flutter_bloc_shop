import 'package:dartz/dartz.dart';
import 'package:online_shop/data/models/Category.dart';

abstract class CategoryRepositoryInterFace {
  Future<Either<String,List<CategoryModel>>> getRemoteCategory();
}