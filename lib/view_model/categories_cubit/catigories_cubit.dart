import 'package:cosmetics/core/constants/consts.dart';
import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/models/category_model.dart';
import 'package:cosmetics/view_model/categories_cubit/categories_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatigoriesCubit extends Cubit<CategoriesState> {
  CatigoriesCubit() : super(CatigoriesInitial());
  static CatigoriesCubit get(context) => BlocProvider.of(context);

  Future<void> getCategories() async {
    emit(GetCatigoriesLoading());

    try {
      final response = await DioHelper.getData(url: categoriesEndpoint);
      List<CategoryModel> categories = (response.data as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();

      emit(GetCatigoriesSuccess(categories));
    } on ApiError catch (error) {
      emit(GetCatigoriesError(error.message));
    }
  }
}
