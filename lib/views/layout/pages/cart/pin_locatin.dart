import 'dart:async';
import 'package:cosmetics/core/style/app_colors.dart';
import 'package:cosmetics/view_model/checkout/checkout_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:cosmetics/core/widgets/app_image.dart';

class PinLocatinView extends StatefulWidget {
  const PinLocatinView({super.key});

  @override
  State<PinLocatinView> createState() => _PinLocatinViewState();
}

class _PinLocatinViewState extends State<PinLocatinView> {
  final LatLng initialPosition = const LatLng(31.0414531, 31.34165);
  final Completer<GoogleMapController> _controller = Completer();
  Set<Marker> markers = {};
  String selectedAddress = 'Select address';
  LatLng? selectedLatLng;

  @override
  void initState() {
    super.initState();
    determinePos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pin Location'),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () => Navigator.pop(context),
            child: CircleAvatar(
              backgroundColor: const Color(0xff101010).withOpacity(0.1),
              child: AppImage(imageName: "arrow_back.svg"),
            ),
          ),
        ),
        actions: [
          TextButton.icon(
            onPressed: () {
              context.read<CheckoutCubit>().setAddress(
                selectedAddress,
                selectedLatLng!,
              );
              Navigator.pop(context);
            },
            label: Text("Save"),
            icon: Icon(Icons.location_pin),
          ),
        ],
      ),
      body: Stack(
        children: [
          GoogleMap(
            initialCameraPosition: CameraPosition(
              target: initialPosition,
              zoom: 12,
            ),
            markers: markers,
            onMapCreated: (controller) => _controller.complete(controller),
            onTap: (latLng) async {
              markers.clear();
              markers.add(
                Marker(
                  markerId: const MarkerId('selectedLoc'),
                  position: latLng,
                ),
              );

              try {
                List<Placemark> placemarks = await placemarkFromCoordinates(
                  latLng.latitude,
                  latLng.longitude,
                );
                Placemark place = placemarks.first;
                String address =
                    "${place.subLocality ?? ''}, ${place.street ?? ''}".trim();
                if (address.isEmpty) address = "Selected Location";

                setState(() {
                  selectedAddress = address;
                  selectedLatLng = latLng;
                });
              } catch (e) {
                setState(() {
                  selectedAddress = "Unknown location";
                  selectedLatLng = latLng;
                });
              }
            },
          ),
          Positioned(
            top: 16,
            left: 16,
            right: 16,
            child: Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  selectedAddress,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> determinePos() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      return;
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) return;
    }

    if (permission == LocationPermission.deniedForever) {
      await Geolocator.openAppSettings();
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    final controller = await _controller.future;
    controller.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 14,
        ),
      ),
    );

    markers.add(
      Marker(
        markerId: const MarkerId('selectedLoc'),
        position: LatLng(position.latitude, position.longitude),
      ),
    );
    setState(() {
      selectedLatLng = LatLng(position.latitude, position.longitude);
    });
  }
}
