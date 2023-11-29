import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:online_shop/config/data.dart';
import 'package:online_shop/data/datasources/Basket/basket_datasource.dart';
import 'package:online_shop/data/datasources/Basket/basket_datasource_impl.dart';
import 'package:online_shop/data/datasources/auth/authentication_datasource.dart';
import 'package:online_shop/data/datasources/auth/authentication_impl.dart';
import 'package:online_shop/data/datasources/banner/banner_data_source.dart';
import 'package:online_shop/data/datasources/banner/banner_data_source_impl.dart';
import 'package:online_shop/data/datasources/category/category_datasource_api.dart';
import 'package:online_shop/data/datasources/category/category_impl.dart';
import 'package:online_shop/data/datasources/categoryProduct/category_product_data_source.dart';
import 'package:online_shop/data/datasources/categoryProduct/category_product_data_source_impl.dart';
import 'package:online_shop/data/datasources/product/product_data_source.dart';
import 'package:online_shop/data/datasources/product/product_data_source_impl.dart';
import 'package:online_shop/data/datasources/productPageDetail/product_detail_data_source.dart';
import 'package:online_shop/data/datasources/productPageDetail/product_detail_data_source_impl.dart';
import 'package:online_shop/data/models/ProductGallery.dart';
import 'package:online_shop/data/repositories/Basket/basket_repository.dart';
import 'package:online_shop/data/repositories/Basket/basket_repository_impl.dart';
import 'package:online_shop/data/repositories/auth/authentication_impl.dart';
import 'package:online_shop/data/repositories/auth/authentication_repository.dart';
import 'package:online_shop/data/repositories/banner/banner_repository.dart';
import 'package:online_shop/data/repositories/banner/banner_repository_impl.dart';
import 'package:online_shop/data/repositories/category/category_repository.dart';
import 'package:online_shop/data/repositories/category/category_repository_impl.dart';
import 'package:online_shop/data/repositories/categoryProduct/category_product_repository.dart';
import 'package:online_shop/data/repositories/categoryProduct/category_product_repository_impl.dart';
import 'package:online_shop/data/repositories/product/product_repository.dart';
import 'package:online_shop/data/repositories/product/product_repository_impl.dart';
import 'package:online_shop/data/repositories/productPageDetail/product_page_detail_repository.dart';
import 'package:online_shop/data/repositories/productPageDetail/product_page_detail_repository_impl.dart';
import 'package:online_shop/services/httpRequest/httpRequest.dart';
import 'package:online_shop/services/httpRequest/httpRequestimpl.dart';
import 'package:online_shop/services/localStorage/localStorage.dart';
import 'package:shared_preferences/shared_preferences.dart';

var ServiceLocator = GetIt.instance;

// register dio service
void initDio()  {
  ServiceLocator.registerSingleton<Dio>(
    Dio(BaseOptions(
      baseUrl: Data.Baseurl,
    ))
  );
}



// ===================== http Request
void initHttpRequest(){
  ServiceLocator.registerSingleton<HttpRequestInterFace>(
    HttpRequest()
  );
}



// ===================== Auth DataSource

void initAuthenticationService(){
  ServiceLocator.registerFactory<AuthenticationInterFace>(() => Authentication());
}



// ===================== Auth Repository

void initAuthenticationRepositoryService(){
  ServiceLocator.registerFactory<AuthenticationRepositoryInterFace>(() => AuthenticationRepository());
}





// ===================== SharedPreferences
 initSharedPreferences() async {
 ServiceLocator.registerSingleton<SharedPreferences>(
      await SharedPreferences.getInstance());}




// ===================== Remote Category DataSource

void initCategoryService(){
  ServiceLocator.registerFactory<CategoryInterFace>(() => CategoryRemoteDataSource());
}


// ===================== Category Repository

void initCategoryRepositoryService(){
  ServiceLocator.registerFactory<CategoryRepositoryInterFace>(() => CategoryRepository());
}



// ===================== Remote Banner DataSource

void initBannerService(){
  ServiceLocator.registerFactory<HomeBannerSliderInterFace>(() => HomeBannerSlider());
}


// ===================== Banner Repository

void initBannerRepositoryService(){
  ServiceLocator.registerFactory<BannerRepositoryInterFace>(() => BannerRepository());
}





// ===================== Remote Product DataSource

void initProductService(){
  ServiceLocator.registerFactory<ProductInterFace>(() => ProductDataSource());
}


// ===================== Product Repository

void initProductRepositoryService(){
  ServiceLocator.registerFactory<ProductRepositoryInterFace>(() => ProductRepository());
}

// ===================== Remote Product Gallery DataSource

void initProductGalleryService(){
  ServiceLocator.registerFactory<ProductDetailInterFace>(() => ProductDetail());
}


// ===================== Product Gallery Repository

void initProductGalleryRepositoryService(){
  ServiceLocator.registerFactory<ProductDetailPageRepositoryInterFace>(() => ProductDetailPageRepository());
}

// ===================== Remote CtegoryProduct DataSource

void initCategoryProductService(){
  ServiceLocator.registerFactory<CategoryProductInterFace>(() => CategoryProduct());
}


// ===================== CtegoryProduct Repository

void initCategoryProductRepositoryService(){
  ServiceLocator.registerFactory<CategoryProductRepositoryInterFace>(() => CategoryProductRepository());
}



// ===================== Basket Local DataSource

void initBasketService(){
  ServiceLocator.registerFactory<BasketInterFace>(() => Basket());
}


// ===================== Basket Local Repository

void initBasketRepositoryService(){
  ServiceLocator.registerFactory<BasketRepositoryInterFace>(() => BasketRepository());
}








Future<void> initServiceLocator() async {
initDio();  
initHttpRequest();
initAuthenticationService();
initAuthenticationRepositoryService();
initSharedPreferences();
initCategoryService();
initCategoryRepositoryService();
initBannerRepositoryService();
initBannerService();
initProductRepositoryService();
initProductService();
initProductGalleryRepositoryService();
initProductGalleryService();
initCategoryProductRepositoryService();
initCategoryProductService();
initBasketRepositoryService();
initBasketService();
}

