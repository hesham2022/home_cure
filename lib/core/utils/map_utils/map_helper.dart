import 'package:flutter/material.dart';
// import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_cure/core/utils/map_utils/location_service.dart';

class MapHelper extends ChangeNotifier {
  MapHelper() {
    if (LocationService.position != null) {
      latLong = LatLng(
        LocationService.position!.latitude,
        LocationService.position!.longitude,
      );
    }
  }
  late GoogleMapController controller;
  LatLng latLong = const LatLng(30, 31);
  CameraPosition initialPosition() => CameraPosition(
        target: latLong,
        zoom: 10,
      );
  void init(GoogleMapController ctr) {
    controller = ctr;
    addMarker(initialPosition().target);
  }

  Future<void> getMyLocation() async {
    final position = await determinePosition();

    if (position != null) {
      latLong = LatLng(position.latitude, position.longitude);
      await controller.animateCamera(
        CameraUpdate.newLatLng(LatLng(position.latitude, position.longitude)),
      );
    }
  }

  // Future<Placemark> getAdressFromCurrent() async {
  //   print('markers.first.position.latitude');
  //   final placemarks = await placemarkFromCoordinates(
  //     markers.first.position.latitude,
  //     markers.first.position.longitude,
  //     localeIdentifier: 'ar',
  //   );
  //   final placemark = placemarks.first;
  //   return placemark;
  // }

  Future<Position?> determinePosition() async {
    try {
      bool serviceEnabled;
      LocationPermission permission;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }

      if (permission == LocationPermission.deniedForever) {}
      return Geolocator.getCurrentPosition();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // void getLocationFromAdreees() {
  //   locationFromAddress(searchController.text).then((value) {
  //     controller.animateCamera(
  //       CameraUpdate.newCameraPosition(
  //         CameraPosition(
  //           target: LatLng(
  //             value.first.latitude,
  //             value.first.longitude,
  //           ),
  //           zoom: 15,
  //         ),
  //       ),
  //     );
  //   });
  // }

  void addMarker(LatLng point) {
    markers
      ..clear()
      ..add(
        Marker(
          markerId: const MarkerId('1'),
          position: point,
          infoWindow: const InfoWindow(
            title: 'I am a marker',
          ),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueRed,
          ),
        ),
      );
    notifyListeners();
  }

  final Set<Marker> markers = {};
  final searchController = TextEditingController();
}
