import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:login_page_customized/models/membership.dart';
import 'package:login_page_customized/screens/advanced_search.dart';
import 'package:login_page_customized/screens/favorite.dart';
import 'package:login_page_customized/screens/my_membership.dart';
import 'package:login_page_customized/screens/myaccount.dart';
import 'package:provider/provider.dart';
import 'appLocalizations.dart';
import 'counter.dart';
import 'env.dart' as env;
import 'models/shop.dart';
import 'screens/octions.dart';
import 'screens/pincode.dart';
import 'package:flutter_test/flutter_test.dart';
import 'screens/registrationscreen.dart';
import 'screens/settings.dart';
import 'screens/shop_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCounter(),
      child: MaterialApp(
        // color: Colors.red,
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
          primaryColor: Colors.orange,
          // applyElevationOverlayColor: true,
          scaffoldBackgroundColor: Colors.grey[100],
          fontFamily: "Almarai",

          appBarTheme: AppBarTheme(
            elevation: 0,
            color: env.trans,
          ),
        ),
       //  home: MyMemberShip(MemberShip.membershipsData),
          home: Registration(),
        // home: ShopDetails(
        //   shop: Shop(
        //     image: "assets/images/shopone.jpg",
        //   ),likecount:50,lovecount:50
        // )
        ),);
  }
}
