import 'package:dartz/dartz.dart';
import 'package:online_shop/data/models/BasketItem.dart';

abstract class BasketRepositoryInterFace {

Either<String,String> addToBasket(BasketItem product);

}