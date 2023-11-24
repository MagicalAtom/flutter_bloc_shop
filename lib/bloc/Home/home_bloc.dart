import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/models/Banner.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/data/models/Product.dart';
import 'package:online_shop/data/repositories/banner/banner_repository_impl.dart';
import 'package:online_shop/data/repositories/category/category_repository_impl.dart';
import 'package:online_shop/data/repositories/product/product_repository_impl.dart';
import 'package:online_shop/di/di_shop.dart';
import 'package:online_shop/services/httpRequest/httpRequest.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final BannerRepositoryInterFace banner = ServiceLocator.get();
  final CategoryRepositoryInterFace category = ServiceLocator.get();
  final ProductRepositoryInterFace product = ServiceLocator.get();
  HomeBloc() : super(HomeInitial()) {
    on<HomeRequestEvent>((event, emit) async {
      emit(HomeLoadingState()); // loading
      final banners = await banner.getBanner(); // connection to repository
      final categories = await category.getRemoteCategory(); // connection to repository
      final products = await product.getProducts(); // connection to repository
      final HottestProduct = await product.getHottestProduct();
      final BestSellerProducts = await product.getBestSellerProducts();// connection to repository
      emit(HomeRequestResponseState(
          banners: banners,
          categories: categories,
          products: products,
          HottestProduct: HottestProduct,
          BestSellerProduct: BestSellerProducts,
          )); // send data to ui
    });
  }
}
