part of 'category_product_bloc.dart';

abstract class CategoryProductState {}

final class CategoryProductInitial extends CategoryProductState {}



final class CategoryProductLoadingState extends CategoryProductState {}




final class CategoryProductRequestResponseState extends CategoryProductState {

Either<String,List<Product>> getCategoryProduct;

CategoryProductRequestResponseState({required this.getCategoryProduct});


}

