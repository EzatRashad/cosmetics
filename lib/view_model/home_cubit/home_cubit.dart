import 'package:cosmetics/core/constants/consts.dart';
import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/models/product_model.dart';
import 'package:cosmetics/models/slider_model.dart';
import 'package:cosmetics/view_model/home_cubit/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeLoading());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getHomeData() async {
    emit(HomeLoading());

    try {
      final slidersResponse = await DioHelper.getData(url: sliderEndpoint);
      final productsResponse = await DioHelper.getData(url: productsEndpoint);

      final sliders = (slidersResponse.data as List)
          .map((e) => SliderModel.fromJson(e))
          .toList();

      final products = (productsResponse.data as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();

      emit(HomeSuccess(sliders: sliders, products: products));
    } on ApiError catch (error) {
      emit(HomeError(error.message));
    }
  }

 
}

// class HomeCubit extends Cubit<HomeState> {
//   HomeCubit() : super(HomeInitial());
//   static HomeCubit get(context) => BlocProvider.of(context);

//   Future<void> getSliders() async {
//     emit(GetSlidersLoading());

//     try {
//       final response = await DioHelper.getData(url: sliderEndpoint);
//       List<SliderModel> sliders = (response.data as List)
//           .map((slider) => SliderModel.fromJson(slider))
//           .toList();

//       emit(GetSlidersSuccess(sliders));
//     } on ApiError catch (error) {
//       emit(GetSlidersError(error.message));
//     }
//   }

//   Future<void> getProducts() async {
//     emit(GetProductsLoading());

//     try {
//       final response = await DioHelper.getData(url: productsEndpoint);
//       List<ProductModel> products = (response.data as List)
//           .map((e) => ProductModel.fromJson(e))
//           .toList();

//       emit(GetProductsSuccess(products));
//     } on ApiError catch (error) {
//       emit(GetProductsError(error.message));
//     }
//   }
// }
