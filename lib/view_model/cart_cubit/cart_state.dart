abstract class CartState {}
class CartInitial extends CartState{}

class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {
  final String message;
  AddToCartSuccess(this.message);
}

class AddToCartError extends CartState {
  final String message;
  AddToCartError(this.message);
}
