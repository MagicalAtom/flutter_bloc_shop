import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/data/models/ProductGallery.dart';
import 'package:online_shop/data/models/ProductProperty.dart';
import 'package:online_shop/data/models/ProductVariant.dart';
import 'package:online_shop/data/repositories/productPageDetail/product_page_detail_repository_impl.dart';
import 'package:online_shop/di/di_shop.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final ProductDetailPageRepositoryInterFace productDetail =
      ServiceLocator.get();
  ProductBloc() : super(ProductInitial()) {
    on<ProductDetailRequestEvent>((event, emit) async {
      emit(ProductLoadingState());
      
      var getImages = await productDetail.getProductGallery(event.product_id);
      var getVariantType =
          await productDetail.getProductVariant(event.product_id);
      var productCategory =
          await productDetail.getProductCategory(event.category_id);
      var productProperties =
          await productDetail.getProductProperty(event.product_id);
      
      emit(ProductRequestResponseState(
          productGallery: getImages,
          productVariantList: getVariantType,
          productCategory: productCategory,
          productProperties: productProperties));
    });
  }
}
