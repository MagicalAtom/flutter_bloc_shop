import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasources/categoryProduct/category_product_data_source_impl.dart';
import 'package:online_shop/data/models/Product.dart';
import 'package:online_shop/data/repositories/categoryProduct/category_product_repository_impl.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/exception/HttpException.dart';

class CategoryProductRepository implements CategoryProductRepositoryInterFace {

  final CategoryProductInterFace categoryProductAccess = ServiceLocator.get();





  @override
  Future<Either<String, List<Product>>> getCategoryProduct(String category_id) async {
    try {
      final categoryProduct = await categoryProductAccess.getCategoryProduct(category_id);
      return right(categoryProduct);
    }on HttpExceptionHandle catch (e) {
      return left(e.message ?? 'خطا داده های برنامه در دسترس نیست');
    }
  
  }

}