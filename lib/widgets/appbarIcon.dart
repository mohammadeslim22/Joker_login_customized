import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/bloc/simple_hidden_drawer_bloc.dart';

class AppBarIcon extends StatelessWidget {
  const AppBarIcon({
    Key key,
    this.icon,
    this.contrller,
    this.scaffoldKey,
    this.func,
  }) : super(key: key);
  final IconData icon;
 // final SimpleHiddenDrawerBloc contrller;
 final ZoomDrawerController contrller;
  final Function func;
  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      color: Colors.black,
      iconSize: 30,
      icon: Icon(icon),
      onPressed: () {
        if (contrller != null) 
        contrller.toggle();
        func();
      },
    );
  }
}
