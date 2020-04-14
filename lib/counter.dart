import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class MyCounter extends ChangeNotifier {
  var loading = false;
  static TickerProvider c;
  static String loginbase=" d";
  static AnimationController _controller;
 // static String 

  final spinkit = SpinKitDoubleBounce(
      color: Colors.white, size: 50.0, controller: _controller);
  Widget f = Padding(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Text(loginbase,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'Almarai',
            color: Colors.white,
            fontSize: 25,
          )));
  changechild(String login) {
    loginbase=login;
    if (loading) {
      f = Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(login,
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
  returnchild(String login) {
    if (!loading) {
      return Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(login,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Almarai',
                    color: Colors.white,
                    fontSize: 25,
                  ))));
      
    } else {
      return spinkit;
      
    }
  }
  togelf() {
    loading = !loading;
  }
}
