import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../env.dart' as env;


class ButtonToUse extends StatelessWidget {
  ButtonToUse(this.buttonstring, {this.fw, this.fc, this.myfunc});
  final String buttonstring;
  final FontWeight fw;
  final Color fc;
  final Function myfunc;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: env.trans,
        elevation: 0,
        child: Text(
          buttonstring,
          style: TextStyle(
            color: fc,
            fontSize: 15,
            fontWeight: fw,
          ),
        ),
        onPressed: () => myfunc());
  }
}