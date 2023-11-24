part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeRequestResponseState extends HomeState {
  Either<String, List<BannerModel>> banners;
  Either<String, List<CategoryModel>> categories;
  Either<String, List<Product>> products;
  Either<String, List<Product>> HottestProduct;
  Either<String,List<Product>> BestSellerProduct; // همون نوعی که از سمت ریپازیتوری مخصوصش میاد رو اینجا قرار میدیم

  // Either<String, List<CategoryModel>> categories;

  HomeRequestResponseState({required this.banners,required this.categories,required this.products,required this.HottestProduct,required this.BestSellerProduct});
}
