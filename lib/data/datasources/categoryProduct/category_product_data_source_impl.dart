import '../../models/Product.dart';

abstract class  CategoryProductInterFace {
Future<List<Product>> getCategoryProduct(String category_id);
}