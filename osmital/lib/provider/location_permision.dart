import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

class LocationProvider with ChangeNotifier {
  late double _latitude;
  late double _longitude;

  double get latitude => _latitude;
  double get longitude => _longitude;

  set latitude(double value) {
    _latitude = value;
    notifyListeners();
  }

  set longitude(double value) {
    _longitude = value;
    notifyListeners();
  }

  getLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;
    // if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
  }

  Future<Position> getCurrentLocation() async {
    // ignore: non_constant_identifier_names
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
    // setState(() {
    //   position = newPosition;
    // mapController.move(LatLng(position!.latitude, position!.longitude), 16);
    // });

    return newPosition;

    // log is use only for printing in debuging mode.
    // log("position: ${position.toString()}");
  }
}
