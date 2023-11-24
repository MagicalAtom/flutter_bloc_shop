import 'package:online_shop/data/models/Product.dart';

abstract class ProductInterFace {
Future<List<Product>> getProducts();
Future<List<Product>> getHottestProducts(); // Most Popular View
Future<List<Product>> getBestSellerProducts(); // Most Popular Best Seller
}