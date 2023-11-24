import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:online_shop/data/models/Category.dart';
import 'package:online_shop/data/repositories/category/category_repository_impl.dart';
import 'package:online_shop/di/di_shop.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepositoryInterFace categoryRepository = ServiceLocator.get();
  CategoryBloc() : super(CategoryInitial()) {
    on<CategoryRequestEvent>((event, emit) async {
      emit(CategoryLoadingState());
      Either<String, List<CategoryModel>> categories =
          await categoryRepository.getRemoteCategory();
      emit(CategoryShowState(categories: categories));
    });
  }
}
