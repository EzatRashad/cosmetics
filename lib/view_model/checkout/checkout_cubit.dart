import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial());

  void setAddress(String address, LatLng position) {
    emit(
      CheckoutLoaded(
        address: address,
        lat: position.latitude,
        lon: position.longitude,
      ),
    );
  }
}
