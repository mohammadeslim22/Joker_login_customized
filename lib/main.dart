import 'package:flutter/material.dart';
import 'package:login_page_customized/login_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:login_page_customized/drawertest.dart';
import 'package:provider/provider.dart';
import 'appLocalizations.dart';
import 'counter.dart';
import 'Octions.dart';
import 'env.dart' as env;

import 'customcard.dart';
import 'movie.dart';
import 'pincode.dart';
import 'package:flutter_test/flutter_test.dart';

import 'registrationscreen.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: [
          Locale("en", "US"),
          Locale('ar', 'AE'),
          Locale('tr', 'TR'),
        ],
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        theme: ThemeData(
          fontFamily: "Almarai",
         accentColor: Colors.white,
          appBarTheme: AppBarTheme(
              color:env.trans,
          ),
        //  scaffoldBackgroundColor: const Color(0xFBFBFB),
        ),
        home: ChangeNotifierProvider(
          create: (context) => MyCounter(),
       //   child:Octions(),
        // child:Inner2Drawer(),
          child:LoginScreen(),
          builder: (context) => MyCounter(),
        ));
  }
}
