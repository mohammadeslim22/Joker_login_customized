import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TextFormInput extends StatelessWidget {
  final String text;
  final TextEditingController cController;
 final  IconData prefixIcon;
  final TextInputType kt;
  final IconData y;
 final  bool obscureText;
  final Widget suffixwidget;
  final bool readOnly;
 final  Function onTab;

  const TextFormInput({Key key, this.text, this.cController, this.prefixIcon, this.kt, this.y, this.obscureText, this.suffixwidget, this.readOnly, this.onTab}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: TextFormField(
        readOnly: readOnly,
        keyboardType: kt,
        onTap: onTab,
        controller: cController,
        style: new TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
            enabledBorder: new OutlineInputBorder(
                borderSide: new BorderSide(
              color: Colors.grey,
            )),
            filled: true,
            fillColor: Colors.white70,
            hintText: text,
            hintStyle: TextStyle(
              fontSize: 15,
            ),
            disabledBorder: OutlineInputBorder(
                borderSide: new BorderSide(
              color: Colors.grey,
            )),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(7),
            ),
            contentPadding: EdgeInsets.symmetric(vertical: 0),
            prefixIcon: Icon(prefixIcon),
            suffixIcon: suffixwidget),
      ),
    );
  }
}
