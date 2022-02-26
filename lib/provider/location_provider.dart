import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';

import '../service/locotion_servise.dart';

class LocationProvider extends ChangeNotifier {
  String adress = 'Reset';
  LocationProvider() {
    updateAdress();
  }

  Future<void> updateAdress() async {
    Position position = await LocatoinPage().getGeoLocationPosition();
    LocatoinPage().location =
        'Lat: ${position.latitude} , Long: ${position.longitude}';
    LocatoinPage()
        .getAddressFromLatLong(position)
        .then((value) => adress = value);
    notifyListeners();
  }
}