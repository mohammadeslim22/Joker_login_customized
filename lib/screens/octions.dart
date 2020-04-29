import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/simple_hidden_drawer.dart';
import 'package:login_page_customized/functions.dart';
import 'package:login_page_customized/models/shop.dart';
import 'package:provider/provider.dart';
import 'package:login_page_customized/widgets/appbarIcon.dart';
import 'package:login_page_customized/widgets/bottom_bar.dart';
import 'package:login_page_customized/counter.dart';
import 'package:login_page_customized/widgets/customcarddiscount.dart';
import 'package:login_page_customized/widgets/customcard.dart';
import 'package:login_page_customized/models/discount.dart';
import 'package:login_page_customized/env.dart' as env;
import 'package:login_page_customized/widgets/myMenu.dart';

class Octions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OctionsScreen();
  }
}

class OctionsScreen extends StatefulWidget {
  OctionsScreen({Key key}) : super(key: key);

  @override
  MyOctionState createState() => new MyOctionState();
}

class MyOctionState extends State<OctionsScreen>
    with SingleTickerProviderStateMixin {
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
    final bool isRTL = (Directionality.of(context) == TextDirection.rtl);

    return SimpleHiddenDrawer(
        // initPosition: 0,
        verticalScalePercent: 60,
        contentCornerRadius: 30,
        enableCornerAnimin: true,
        enableScaleAnimin: true,
        isDraggable: true,
        typeOpen: !isRTL ? TypeOpen.FROM_LEFT : TypeOpen.FROM_RIGHT,
        menu: MenuScreen(),
        screenSelectedBuilder: (
          position,
          controller,
        ) {
          return Oc(
            controller: controller,
          );
        });
  }
}

class Oc extends StatefulWidget {
  final controller;

  const Oc({Key key, this.controller}) : super(key: key);
  @override
  OcState createState() => OcState(controller);
}

class OcState extends State<Oc> with TickerProviderStateMixin {
  final controller;
  AnimationController _hide;

  OcState(this.controller);
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
    _hide = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );
    _hide.forward();
  }

  @override
  Widget build(BuildContext context) {
    final bolc = Provider.of<MyCounter>(context);
    Widget texCity() {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          
          Flexible(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      translate(context, 'discount_offers'),
                      style: new TextStyle(
                        fontSize: 25.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child:
                        Text("في المملكة العربية السعودية", style: env.mystyle),
                  )
                ]),
          ),
          const SizedBox(
            width: 40,
          ),
          // here its wac a Card
          RaisedButton(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
            color: Colors.white,
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(100),
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
                new Image.asset(
                  "assets/images/filter.png",
                  height: 25,
                  width: 25,
                ),
              ],
            ),
            onPressed: () {},
          ),
        ],
      );
    }

    return NotificationListener<ScrollNotification>(
      onNotification: _handleScrollNotification,
      child: Scaffold(
        appBar: AppBar(
          leading: AppBarIcon(contrller: controller, icon: Icons.sort),
          actions: <Widget>[
            AppBarIcon(icon: Icons.search),
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
                  : ShopList(Shop.movieData),
            )
          ],
        ),
        bottomNavigationBar: SizeTransition(
          sizeFactor: _hide,
          child: BottomContent(currentIndex: bolc.bottomNavIndex),
        ),
      ),
    );
  }
}
