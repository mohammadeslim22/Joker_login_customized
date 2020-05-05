import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'appLocalizations.dart';

String translate(BuildContext context, String key) {
  return AppLocalizations.of(context).translate(key);
}

Future<List<String>> getLocation() async {
  bool serviceEnabled;
  PermissionStatus permissionGranted;
  LocationData locationData;
  final List<String> locaion = <String>[];
  final Location location = Location();

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

Widget myBottomAppBar(BuildContext context) {
  return BottomAppBar(
    color: Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        Container(
            width: 60,
            child: Column(
              children: <Widget>[
                Icon(Icons.local_offer),
                Text(translate(context, 'discounts')),
                Divider(color: Colors.black)
              ],
            )),
        VerticalDivider(color: Colors.red),
        Container(
            width: 60,
            child: Column(
              children: <Widget>[
                Icon(Icons.local_offer),
                Text(translate(context, 'discounts')),
                Divider(color: Colors.black)
              ],
            ))
      ],
    ),
  );
}
