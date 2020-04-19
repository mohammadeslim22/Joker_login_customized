import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'appLocalizations.dart';
import 'counter.dart';
import 'Octions.dart';
import 'pincode.dart';

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
          primarySwatch: Colors.blue,
        ),
        home: ChangeNotifierProvider(
          create: (context) => MyCounter(),
       //   child:AutoLocate(lat:31.5,long:34.5),
        child: PinCode(monileNo:"0567505238"),
         // child:LoginScreen(),
        //  child:Registration(),
      // child:Octions(),
          builder: (context) => MyCounter(),
        ));
  }
}
