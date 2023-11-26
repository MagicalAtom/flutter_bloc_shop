import 'package:dartz/dartz.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/data/models/ProductGallery.dart';
import 'package:online_shop/data/models/ProductVariant.dart';
import 'package:online_shop/data/models/VariantType.dart';

abstract class ProductDetailPageRepositoryInterFace {
  /*
  در ریپازیتوری ها هم اون قسمتی که قراره داده ی گرفته شده از دیتاسورس رو برگردونه تایپش مثل دیتاسورس میشه
  چون قراره داده اش از آینده بیاد و طول میکشه پس فیوچر هست
  */
  Future<Either<String,List<ProductGallery>>> getProductGallery(String product_id);
  Future<Either<String,List<VariantType>>> getVariantType();
  Future<Either<String,List<productVariant>>> getProductVariant(String product_id);
  Future<Either<String,CategoryModel>> getProductCategory(String category_id);
}