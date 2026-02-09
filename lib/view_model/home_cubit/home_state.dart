import 'package:cosmetics/models/product_model.dart';
import 'package:cosmetics/models/slider_model.dart';

abstract class HomeState {}

class HomeLoading extends HomeState {}

class HomeSuccess extends HomeState {
  final List<SliderModel> sliders;
  final List<ProductModel> products;
  final bool isSearching;

  HomeSuccess({
    required this.sliders,
    required this.products,
    this.isSearching = false,
  });
}

class HomeError extends HomeState {
  final String message;

  HomeError(this.message);
}
