import 'package:cosmetics/models/cart_model.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {
  final String message;
  AddToCartSuccess(this.message);
}

class AddToCartError extends CartState {
  final String message;
  AddToCartError(this.message);
}

class GetCartLoading extends CartState {}

class GetCartSuccess extends CartState {
  final CartModel cartModel;
  GetCartSuccess(this.cartModel);
}

class GetCartError extends CartState {
  final String message;
  GetCartError(this.message);
}

class RemoveFromCartLoading extends CartState {}

class RemoveFromCartSuccess extends CartState {
  final String message;
  RemoveFromCartSuccess({required this.message});
}

class RemoveFromCartError extends CartState {
  final String error;
  RemoveFromCartError(this.error);
}

class UpdateCartItemLoading extends CartState {}

class UpdateCartItemSuccess extends CartState {
  final String message;
  UpdateCartItemSuccess({required this.message});
}

class UpdateCartItemError extends CartState {
  final String error;
  UpdateCartItemError(this.error);
}
