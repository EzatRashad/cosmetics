import 'dart:convert';

import 'package:cosmetics/core/error/api_error.dart';
import 'package:cosmetics/core/services/dio_helper.dart';
import 'package:cosmetics/core/constants/api_constants.dart';
import 'package:cosmetics/models/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  static CartCubit get(context) => BlocProvider.of(context);

  Future<void> getCart() async {
    emit(GetCartLoading());
    try {
      final response = await DioHelper.getData(url: getCartEndpoint);
      emit(GetCartSuccess(CartModel.fromJson(response.data)));
    } on ApiError catch (error) {
      emit(GetCartError(error.message));
    }
  }

  Future<void> updateCartItem({
    required String productId,
    required int quantity,
  }) async {
    try {
      await DioHelper.put(
        url: updateCartItemEndpoint,
        queryParameters: {
          "quantity": quantity.toString(),
          "productId": productId,
        },
      );
      await getCart();
      emit(
        UpdateCartItemCartSuccess.UpdateCartItemSuccess(
          message: "Updated Successfully",
        ),
      );
    } on ApiError catch (error) {
      emit(UpdateCartItemError(error.message));
    }
  }

  Future<void> removeItem({required String itemId}) async {
    try {
      await DioHelper.remove(url: "$deleteCartItemEndpoint$itemId");
      await getCart();
      emit(RemoveFromCartSuccess(message: "Item removed"));
    } on ApiError catch (error) {
      emit(RemoveFromCartError(error.message));
    }
  }

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

      emit(AddToCartSuccess(data["message"] ?? "Try in another time"));
    } on ApiError catch (error) {
      emit(AddToCartError(error.message));
    }
  }
}
