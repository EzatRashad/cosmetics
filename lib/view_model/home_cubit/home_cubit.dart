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

  List<ProductModel> allProducts = [];
  List<ProductModel> filteredProducts = [];

  Future<void> getHomeData() async {
    emit(HomeLoading());

    try {
      final slidersResponse = await DioHelper.getData(url: sliderEndpoint);
      final productsResponse = await DioHelper.getData(url: productsEndpoint);

      final sliders = (slidersResponse.data as List)
          .map((e) => SliderModel.fromJson(e))
          .toList();

      allProducts = (productsResponse.data as List)
          .map((e) => ProductModel.fromJson(e))
          .toList();

      filteredProducts = allProducts;

      emit(HomeSuccess(sliders: sliders, products: filteredProducts,isSearching: false));
    } on ApiError catch (error) {
      emit(HomeError(error.message));
    }
  }

  void searchProducts(String query) {
    bool searching = query.isNotEmpty;

    if (query.isEmpty) {
      filteredProducts = allProducts;
    } else {
      filteredProducts = allProducts.where((product) {
        return product.name!
            .toLowerCase()
            .contains(query.toLowerCase());
      }).toList();
    }

    if (state is HomeSuccess) {
      emit(HomeSuccess(
        sliders: (state as HomeSuccess).sliders,
        products: filteredProducts,
        isSearching: searching,
      ));
    }
  }

}
