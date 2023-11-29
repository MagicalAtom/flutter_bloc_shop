import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/models/Product.dart';
import 'package:online_shop/data/repositories/categoryProduct/category_product_repository_impl.dart';
import 'package:online_shop/di/di_shop.dart';

part 'category_product_event.dart';
part 'category_product_state.dart';

class CategoryProductBloc
    extends Bloc<CategoryProductEvent, CategoryProductState> {
          final CategoryProductRepositoryInterFace categoryProduct =
        ServiceLocator.get();
  CategoryProductBloc() : super(CategoryProductInitial()) {
    on<CategoryProductRequestEvent>((event, emit) async {
      emit(CategoryProductLoadingState());
      final getProduct =
          await categoryProduct.getCategoryProduct(event.category_id);
      emit(CategoryProductRequestResponseState(getCategoryProduct: getProduct));
    });
  }
}
