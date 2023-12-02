import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/models/BasketItem.dart';
import 'package:online_shop/data/repositories/Basket/basket_repository_impl.dart';
import 'package:online_shop/di/di_shop.dart';

part 'basket_event.dart';
part 'basket_state.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  BasketBloc() : super(BasketInitial()) {
    final BasketRepositoryInterFace basket = ServiceLocator.get();
    on<RequestBasketEvent>((event, emit) async {
      emit(BasketRequestLoading());
      final getBasketItems = await basket.getBasketList();
      emit(BasketRequestResponseState(basketList: getBasketItems));
    });
  }
}
