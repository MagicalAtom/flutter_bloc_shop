import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasources/productPageDetail/product_detail_data_source_impl.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/data/models/ProductGallery.dart';
import 'package:online_shop/data/models/ProductVariant.dart';
import 'package:online_shop/data/models/VariantType.dart';
import 'package:online_shop/data/repositories/productPageDetail/product_page_detail_repository_impl.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/exception/HttpException.dart';

class ProductDetailPageRepository implements ProductDetailPageRepositoryInterFace {
  final ProductDetailInterFace productDetail = ServiceLocator.get();
  @override
  Future<Either<String, List<ProductGallery>>> getProductGallery(
      String product_id) async {
    try {
      final productGallery = await productDetail.getProductGallery(product_id);
      return right(productGallery);
    } on HttpExceptionHandle catch (e) {
      return left(e.message ?? 'خطا داده ها در دسترس نیست');
    }
  }

  @override
  Future<Either<String, List<VariantType>>> getVariantType() async {
    try {
      final getVariantType = await productDetail.getVariantType();
      return right(getVariantType);
    } on HttpExceptionHandle catch (e) {
      return left(e.message ?? 'خطا داده ها در دسترس نیست');
    }
  }

  @override
  Future<Either<String, List<productVariant>>> getProductVariant(String product_id) async {
    try {
      final ProductVariant =  await productDetail.getPrductVariants(product_id);
      return right(ProductVariant);
    }on HttpExceptionHandle catch(e){
      return left(e.message ?? 'خطا داده های برنامه در دسترس نیست');
    }



  }

  @override
  Future<Either<String, CategoryModel>> getProductCategory(String category_id) async {
    try{
      final productCategory = await productDetail.getProductCategory(category_id);
      return right(productCategory);
    }on HttpExceptionHandle catch(e){
      return left(e.message ?? 'خطا داده های برنامه در دسترس نیست');
    }




  }
}
