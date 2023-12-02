import 'package:dartz/dartz.dart';
import 'package:online_shop/data/datasources/Basket/basket_datasource_impl.dart';
import 'package:online_shop/data/models/BasketItem.dart';
import 'package:online_shop/data/repositories/Basket/basket_repository_impl.dart';
import 'package:online_shop/di/di_shop.dart';

class BasketRepository implements BasketRepositoryInterFace {
  final BasketInterFace basket = ServiceLocator.get();

  @override
  Either<String, String> addToBasket(BasketItem product) {
    try {
    basket.addToBasket(product);
    return right('محصول با موفقیت اضافه شد');
    } catch (e) {
      return left(e.toString() ?? 'خطا برنامه به مشکل خورد !');
    }
  }
  
  @override
  Future<Either<String, List<BasketItem>>> getBasketList() async {
    try {
      final items = await basket.getBasketList();
      return right(items);
    } catch (e) {
      return left(e.toString() ?? 'خطا داده های برنامه در دسترس نیست');
    }


  }
  
  
  
  
  
  
  
  }