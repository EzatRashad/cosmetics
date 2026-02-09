import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(CheckoutInitial()) {
    loadCurrentLocation();
  }

  void setAddress(String address, LatLng position) {
    emit(
      CheckoutLoaded(
        address: address,
        lat: position.latitude,
        lon: position.longitude,
      ),
    );
  }

  Future<void> loadCurrentLocation() async {
    emit(CheckoutLoading());
    try {
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) return;

      LocationPermission permission = await Geolocator.checkPermission();

      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) return;
      }

      if (permission == LocationPermission.deniedForever) return;

      final position = await Geolocator.getCurrentPosition();

      final placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      final place = placemarks.first;

      String address = "${place.subLocality ?? ''}, ${place.street ?? ''}"
          .trim();

      if (address.isEmpty) address = "Current Location";

      setAddress(address, LatLng(position.latitude, position.longitude));
    } catch (e) {
      emit(CheckoutError(e.toString()));
    }
  }
}
