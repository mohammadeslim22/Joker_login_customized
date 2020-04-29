import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/provider/simple_hidden_drawer_provider.dart';
import 'package:provider/provider.dart';
import 'package:login_page_customized/counter.dart';
import 'package:login_page_customized/functions.dart';
import 'package:login_page_customized/env.dart' as env;

class SettingBottom extends StatelessWidget {
  const SettingBottom({
    this.currentIndex,
    //this.c,
  });

  final int currentIndex;
  //final BuildContext c;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(translate(context, "user_account")),
          RaisedButton(
            splashColor: Colors.transparent,
            highlightElevation: 0,
            highlightColor: Colors.transparent,
            elevation: 0,
            color: env.trans,
            onPressed: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                new Image.asset(
                  "assets/images/delete.png",
                  height: 20,
                  width: 20,
                  color: Colors.red,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  translate(context, "cancel_account"),
                  style: env.redstyle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
