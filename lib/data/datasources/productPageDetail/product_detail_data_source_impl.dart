import 'package:online_shop/data/models/ProductGallery.dart';
import 'package:online_shop/data/models/ProductVariant.dart';
import 'package:online_shop/data/models/Variant.dart';
import 'package:online_shop/data/models/VariantType.dart';

abstract class  ProductDetailInterFace {

/*
دیتاسورس ها چون محل گرفتن دیتا هستن پس باید نوعشون یکی باشه با نوع دیتا
*/

Future<List<ProductGallery>> getProductGallery(String product_id);
Future<List<VariantType>> getVariantType(); 
Future<List<Varaint>> getVariants();
Future<List<productVariant>> getPrductVariants();



}