part of 'category_bloc.dart';

@immutable
abstract class CategoryState {}

final class CategoryInitial extends CategoryState {}



final class CategoryLoadingState extends CategoryState{}




final class CategoryShowState extends CategoryState{

Either<String, List<CategoryModel>> categories;

CategoryShowState({required this.categories});

}
