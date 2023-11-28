part of 'category_product_bloc.dart';

@immutable
sealed class CategoryProductEvent {}





final class CategoryProductRequestEvent extends CategoryProductEvent {
String category_id;
CategoryProductRequestEvent({required this.category_id});
}
