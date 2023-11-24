import 'package:dartz/dartz.dart';
import 'package:online_shop/data/models/Product.dart';

abstract class ProductRepositoryInterFace {

  Future<Either<String,List<Product>>> getProducts();
  Future<Either<String,List<Product>>> getHottestProduct();
  Future<Either<String,List<Product>>> getBestSellerProducts();

}