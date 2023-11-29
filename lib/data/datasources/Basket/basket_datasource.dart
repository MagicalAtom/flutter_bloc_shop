import 'package:online_shop/data/datasources/Basket/basket_datasource_impl.dart';
import 'package:online_shop/data/models/BasketItem.dart';
import 'package:online_shop/services/Hive/Hive.dart';

class Basket implements BasketInterFace {
  @override
  Future<void> addToBasket(BasketItem product) async {
  var basketBox = hive.open<BasketItem>('BasketBox');
    basketBox.add(product);
  }
}
