import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../models/merchant.dart';
import '../functions.dart';
import '../models/shop.dart';
import 'package:provider/provider.dart';
import '../widgets/appbarIcon.dart';
import '../widgets/bottom_bar.dart';
import '../counter.dart';
import '../widgets/customcarddiscount.dart';
import '../widgets/customcard.dart';
import '../models/discount.dart';
import '../env.dart' as env;
import '../widgets/myMenu.dart';

class OctionsCopy extends StatelessWidget {
  const OctionsCopy({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OctionsScreen();
  }
}

class OctionsScreen extends StatefulWidget {
  @override
  MyOctionState createState() => MyOctionState();
}

class MyOctionState extends State<OctionsScreen>
    with SingleTickerProviderStateMixin {
  final ZoomDrawerController _drawerController = ZoomDrawerController();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;
    return ZoomDrawer(
      controller: _drawerController,
      menuScreen: MenuScreen(),
      mainScreen: Oc(
        controller: _drawerController,
      ),
      borderRadius: 30.0,
      angle: 0,
      backgroundColor: Colors.white,
      showShadow: true,

      slideWidth: MediaQuery.of(context).size.width * (isRTL != null? .85: 0.85),
    );
  }
}


class Oc extends StatefulWidget {
  const Oc({Key key, this.controller}) : super(key: key);
  final ZoomDrawerController controller;
  @override
  OcState createState() => OcState(controller);
}

class OcState extends State<Oc> with TickerProviderStateMixin {
  OcState(this.controller);
  List<Data> templList;
  final ZoomDrawerController controller;
  AnimationController _hide;
  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  void initState() {
    super.initState();
    //  response();
    _hide = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _hide.forward();
  }

  int dataloaded = 0;
  static Dio dio = Dio();
  static Future<List<Data>> response() async {
    final Response<String> respons = await dio.get<String>(
        'https://www.space.co.ps/joker/api/ar/v1/customer/merchants');

        final Merchant merchant = Merchant.fromJson(json.decode(respons.data));

   // final List<Merchant> parsedList = (json.decode(respons.data)['data'] as List<dynamic>).map((dynamic val)=> Merchant.fromJson(val)).toList(); 
   // List<Merchant> list = parsedList.map((val) =>  Merchant.fromJson(val)).toList();
   // final List<Merchant> list = Merchant.fromJson(parsedList);
    
    // final signUp = Merchant.fromJson(parsedList);
    //  final List<Merchant> list=[] ;
    // parsedList.map<String, dynamic>((val) =>  Merchant.fromJson(val)).toList();
    return merchant.data;
  }

  static final Future<List<Data>> shops = response();
  @override
  Widget build(BuildContext context) {
    final MyCounter bolc = Provider.of<MyCounter>(context);
    Widget texCity() {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      translate(context, 'discount_offers'),
                      style: const TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 10, 0, 10),
                    child: Text("In the Kingdom of Saudi Arabia",
                        style: env.mystyle),
                  )
                ]),
          ),
          const SizedBox(
            width: 40,
          ),
          RaisedButton(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            color: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
            ),
            child: Row(
              children: <Widget>[
                Text(
                  translate(context, 'flitring'),
                  style: env.mystyle,
                ),
                const SizedBox(
                  width: 10,
                ),
                Image.asset(
                  "assets/images/filter.png",
                  height: 25,
                  width: 25,
                ),
              ],
            ),
            onPressed: () {},
          ),
          const SizedBox(
            width: 7,
          )
        ],
      );
    }

    return FutureBuilder<List<Data>>(
        future: shops,
        builder: (BuildContext ctx, AsyncSnapshot<List<Data>> snapshot) {
          shops.then((List<Data> onValue){
            templList= onValue;
          });
          if (snapshot.connectionState == ConnectionState.done) {
            
            return NotificationListener<ScrollNotification>(
              onNotification: _handleScrollNotification,
              child: Scaffold(
                appBar: AppBar(
                  leading: AppBarIcon(contrller: controller, icon: Icons.sort),
                  actions: <Widget>[
                    AppBarIcon(
                      icon: Icons.search,
                      func: () {},
                    ),
                    AppBarIcon(icon: Icons.notifications_none),
                  ],
                ),
                body: Column(
                  children: <Widget>[
                    const SizedBox(
                      height: 10,
                    ),
                    texCity(),
                    const SizedBox(
                      height: 12,
                    ),
                    Expanded(
                      child: (bolc.bottomNavIndex == 1)
                          ? DiscountsList(Discount.movieData)
                          : ShopList(templList),
                    )
                  ],
                ),
                bottomNavigationBar: SizeTransition(
                  sizeFactor: _hide,
                  child: BottomContent(),
                ),
              ),
            );
          } else {
            return const Center(
                child: CircularProgressIndicator(
              backgroundColor: Colors.transparent,
            ));
          }
        });
    // FlareLoading(
    //   name: 'assets/images/logo.png',
    //   loopAnimation: 'Loading',
    //   endAnimation: 'Complete',
    //   isLoading: _isLoading,
    //   onSuccess: (dynamic data) {
    //     print('Finished');
    //   },
    //   onError: (dynamic error, dynamic stacktrace) {},
    // );
  }
}
