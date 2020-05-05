import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:login_page_customized/screens/advanced_search.dart';
import 'package:login_page_customized/screens/registrationscreen.dart';
import 'package:login_page_customized/screens/settings.dart';
import 'package:provider/provider.dart';
import 'appLocalizations.dart';
import 'counter.dart';
import 'env.dart' as env;
import 'screens/login_screen.dart';
import 'screens/octions.dart';
import 'screens/pincode.dart';
import 'screens/settings.dart';
import 'screens/shop_details.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MyCounter>(
      create: (BuildContext context) => MyCounter(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        supportedLocales: const <Locale>[
          Locale("en", "US"),
          Locale('ar', 'AE'),
          Locale('tr', 'TR'),
        ],
        localizationsDelegates: <LocalizationsDelegate<dynamic>>[
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: <String, Widget Function(BuildContext)>{
          '/Reg': (BuildContext context) => const Registration(),
          '/Log': (BuildContext context) => const LoginScreen(),
          '/Pin': (BuildContext context) => const PinCode(),
          '/Home': (BuildContext context) => const Octions(),
          '/AdSe': (BuildContext context) => const AdvancedSearch(),
          '/ShDe': (BuildContext context) => const ShopDetails(),
          '/Sett': (BuildContext context) => const Settings(),
        },
        theme: ThemeData(
          primaryColor: Colors.orange,
          scaffoldBackgroundColor: Colors.grey[100],
          fontFamily: "Almarai",
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: env.trans,
          ),
        ),
        //  home: MyMemberShip(MemberShip.membershipsData),
        // home: const ShopDetails(
        //   shop: Shop(
        //     image: "assets/images/shopone.jpg",
        //   ),
        //   likecount: 50,
        //   lovecount: 100,
        // ),
         home: const Registration()
      ),
    );
  }
}
