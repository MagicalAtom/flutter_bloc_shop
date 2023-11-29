import 'package:dartz/dartz.dart';
import 'package:online_shop/data/models/Product.dart';

abstract class  CategoryProductRepositoryInterFace {

Future<Either<String,List<Product>>> getCategoryProduct(String category_id);

}