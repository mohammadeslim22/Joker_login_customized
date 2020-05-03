import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class MyCounter extends ChangeNotifier {
  var loading = false;
  static TickerProvider c;
  static String loginbase = "login";
  static AnimationController _controller;
  int _currentIndex = 0;
  int favocurrentIndex = 0;
  List<bool> fontlist = [true, false, false];
  List<bool> language = [true, false, false];
  bool _visible = true;
  bool __visible = false;

  int get bottomNavIndex => _currentIndex;
  bool get visible1 => _visible;
  List<bool> get font => fontlist;
    List<bool> get lang => language;

  bool get visible2 => __visible;
  changebottomNavIndex(int id) {
    _currentIndex = id;

    notifyListeners();
  }
  changelanguageindex(int index) {
    for (int i = 0; i < language.length; i++) {
      if (i == index) {
        language[i] = true;
      } else {
        language[i] = false;
      }
    }

    notifyListeners();
  }
  changefontindex(int index) {
    for (int i = 0; i < fontlist.length; i++) {
      if (i == index) {
        fontlist[i] = true;
      } else {
        fontlist[i] = false;
      }
    }

    notifyListeners();
  }

  changeTabBarIndex(int id) {
    favocurrentIndex = id;
    _visible = !_visible;
    __visible = !__visible;

    print(visible2);
    print(visible1);
    notifyListeners();
  }

  final spinkit = SpinKitDoubleBounce(
      color: Colors.white, size: 50.0, controller: _controller);
  Widget f = Padding(
      padding: EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Text(loginbase,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 25,
          )));
  changechild(String login) {
    loginbase = login;
    if (loading) {
      f = Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Padding(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Text(login,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
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
