library env;

import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';

Color mainColor = Colors.white;
Color trans =Colors.transparent;
Color blue = Colors.blue;
TextStyle mylight = const TextStyle(
  fontWeight: FontWeight.w100,
  color: Colors.grey,
  fontSize: 15,
);
TextStyle mysmalllight = const TextStyle(
  fontWeight: FontWeight.w100,
  color: Colors.grey,
  fontSize: 12,
);
TextStyle mysmall = const TextStyle(
  fontWeight: FontWeight.w100,
  color: Colors.black,
  fontSize: 13,
);
TextStyle mystyle = const TextStyle(
  fontWeight: FontWeight.w100,
  color: Colors.black,
  fontSize: 15,
);
TextStyle mystyle2 = const TextStyle(
  fontWeight: FontWeight.bold,
  color: Colors.black,
  fontSize: 40,
);
TextStyle underHead = const TextStyle(
  fontWeight: FontWeight.w100,
  color: Color(0xFF303030),
  fontSize: 20,
);
TextStyle underHeadblack = const TextStyle(
  fontWeight: FontWeight.w100,
  color: Colors.black,
  fontSize: 20,
);
TextStyle notificationNO = const TextStyle(
  fontWeight: FontWeight.w100,
  color: Colors.white,
  fontSize: 20,
);
TextStyle resend = const TextStyle(
  fontWeight: FontWeight.w100,
  color: Colors.orange,
  fontSize: 20,
);
TextStyle redstyle = const TextStyle(
  fontWeight: FontWeight.w100,
  color: Colors.red,
  fontSize: 12,
);

Address first;
Coordinates coordinates;
List<Address> addresses;

double lat;
double long;

final TextEditingController usernameController = TextEditingController();
final TextEditingController emailController = TextEditingController();
final TextEditingController mobileNoController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController birthDateController = TextEditingController();
final TextEditingController locationController = TextEditingController();
