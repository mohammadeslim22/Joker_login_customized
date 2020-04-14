import 'package:flutter/material.dart';
import 'appLocalizations.dart';

String trans(BuildContext context, String key)
{
  return  AppLocalizations.of(context).translate(key);
}