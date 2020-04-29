import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/bloc/simple_hidden_drawer_bloc.dart';

class AppBarIcon extends StatelessWidget {
  final IconData icon;
  final SimpleHiddenDrawerBloc contrller;
  const AppBarIcon({
    Key key,
    this.icon, this.contrller, this.scaffoldKey,
  }) : super(key: key);

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      
      color: Colors.black,
      iconSize: 30,
      icon: Icon(icon),
      onPressed: () {contrller.toggle();},
    );
  }
}
