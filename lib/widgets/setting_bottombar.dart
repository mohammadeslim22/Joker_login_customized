import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../functions.dart';
import '../env.dart' as env;

class SettingBottom extends StatelessWidget {
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
                 Image.asset(
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
