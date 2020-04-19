import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'appLocalizations.dart';

String trans(BuildContext context, String key)
{
  return  AppLocalizations.of(context).translate(key);
}
  Future<List<String>> getLocation() async {
      bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;
  List<String> locaion= new List<String>();
    Location location = new Location();

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return locaion;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return locaion;
      }
    }

    locationData = await location.getLocation();
    locaion.add(locationData.latitude.toString());
    locaion.add(locationData.longitude.toString());
    return locaion;
  }