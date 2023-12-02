part of 'basket_bloc.dart';

@immutable
sealed class BasketState {}

final class BasketInitial extends BasketState {}

final class BasketRequestLoading extends BasketState {}

final class BasketRequestResponseState extends BasketState {
  Either<String,List<BasketItem>> basketList;
  BasketRequestResponseState({required this.basketList});
}
