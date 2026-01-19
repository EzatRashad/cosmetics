import 'dart:developer';
import 'dart:convert';

import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  Future<void> addToCart({required String productId, int quantity = 1}) async {

    emit(AddToCartLoading());

    try {
      final response = await DioHelper.postData(
        url: addToCartEndpoint,
        queryParameters: {
          "productId": productId,
          "quantity": quantity.toString(),
        },
      );

      final data = response.data is String
          ? Map<String, dynamic>.from(jsonDecode(response.data))
          : response.data as Map<String, dynamic>;

      log(data["message"].toString());

      emit(AddToCartSuccess(data["message"] ?? "Try in another time"));
    } on ApiError catch (error) {
      log("eeeeeeeeeeeeeeeeeeeeeeeeeee");
      log(error.message);

      emit(AddToCartError(error.message));
    }
  }
}
