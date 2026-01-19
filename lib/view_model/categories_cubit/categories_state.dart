import 'package:cosmetics/models/category_model.dart';

abstract class CategoriesState {}

class CatigoriesInitial extends CategoriesState {}

class GetCatigoriesLoading extends CategoriesState {}

class GetCatigoriesSuccess extends CategoriesState {
  final List<CategoryModel> categoryList;
  GetCatigoriesSuccess(this.categoryList);
}

class GetCatigoriesError extends CategoriesState {
  GetCatigoriesError(this.message);

  final String message;
}
