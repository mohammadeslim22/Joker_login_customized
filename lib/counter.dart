import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyCounter extends ChangeNotifier {
  var loading = false;
  static TickerProvider c;
  static AnimationController _controller;

  final spinkit = SpinKitDoubleBounce(
      color: Colors.white, size: 50.0, controller: _controller);
  Widget f = Padding(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Text("تسجيل الدخول",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Almarai',
            color: Colors.white,
            fontSize: 25,
          )));
  changechild() {
    if (loading) {
      f = Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text("تسجيل الدخول",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Almarai',
                    color: Colors.white,
                    fontSize: 25,
                  ))));
      notifyListeners();
    } else {
      f = spinkit;
      notifyListeners();
    }
    //loading = !loading;
    notifyListeners();
  }

  togelf() {
    loading = !loading;
  }
}
