abstract class CheckoutState {}

class CheckoutInitial extends CheckoutState {}

class CheckoutLoaded extends CheckoutState {
  final String address;
  final double lat;
  final double lon;

  CheckoutLoaded({
    required this.address,
    required this.lat,
    required this.lon,
  });

  bool get isOrderEnabled => address.isNotEmpty;
}

class CheckoutLoading extends CheckoutState{}
class CheckoutError extends CheckoutState {
  final String message;
  CheckoutError(this.message);
}
