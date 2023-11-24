import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasources/category/category_impl.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/data/repositories/category/category_repository_impl.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/exception/HttpException.dart';

class CategoryRepository implements CategoryRepositoryInterFace {
  CategoryInterFace categoryDataSource = ServiceLocator.get();

 @override
Future<Either<String,List<CategoryModel>>> getRemoteCategory() async {
  try {
    List<CategoryModel> response = await categoryDataSource.getCategory();
    return right(response);
  }on HttpExceptionHandle catch(e){
    return left(e.message ?? 'خطا');
  }
}


}