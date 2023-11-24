import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasources/product/product_data_source_impl.dart';
import 'package:online_shop/data/models/Product.dart';
import 'package:online_shop/data/repositories/product/product_repository_impl.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/exception/HttpException.dart';

class ProductRepository implements ProductRepositoryInterFace {
  final ProductInterFace productDataSource = ServiceLocator.get();
  @override
  Future<Either<String, List<Product>>> getProducts() async {
    try{
      List<Product> products = await productDataSource.getProducts();
      return right(products);
    }on HttpExceptionHandle catch(e){
      return left(e.message ?? 'خطا داده ها در دسترس نیست');
    }




  }
  
  @override
  Future<Either<String, List<Product>>> getHottestProduct() async {

    try {
      List<Product> HottestProduct = await productDataSource.getHottestProducts();
      return right(HottestProduct);
    }on HttpExceptionHandle catch(e){
      return left(e.message ?? 'خطا داده ها در دسترس نیست');
    }

  }
  
  @override
  Future<Either<String, List<Product>>> getBestSellerProducts() async {

    try {
      List<Product> BestSellerProduct = await productDataSource.getBestSellerProducts();
      return right(BestSellerProduct);
    }on HttpExceptionHandle catch (e) {
      return left(e.message ?? 'خطا داده های در دسترس نیست');
    }

  }
}