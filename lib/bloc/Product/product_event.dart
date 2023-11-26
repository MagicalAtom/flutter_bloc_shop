// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}



class ProductDetailRequestEvent extends ProductEvent {
  String product_id;
  String category_id;

  
  ProductDetailRequestEvent({
    required this.product_id,
    required this.category_id,
  });



}
