import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/simple_hidden_drawer.dart';
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

class Octions extends StatelessWidget {
    const Octions({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return OctionsScreen();
  }
}

class OctionsScreen extends StatefulWidget {

  @override
  MyOctionState createState() =>  MyOctionState();
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
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;

    return SimpleHiddenDrawer(
        verticalScalePercent: 60,
        contentCornerRadius: 30,
        enableCornerAnimin: true,
        enableScaleAnimin: true,
        isDraggable: true,
        typeOpen: !isRTL ? TypeOpen.FROM_LEFT : TypeOpen.FROM_RIGHT,
        menu: MenuScreen(),
        screenSelectedBuilder: (
          int position,
          SimpleHiddenDrawerBloc controller,
        ) {
          return Oc(
            controller: controller,
          );
        });
  }
}

class Oc extends StatefulWidget {
  const Oc({Key key, this.controller}) : super(key: key);
  final SimpleHiddenDrawerBloc controller;
  @override
  OcState createState() => OcState(controller);
}

class OcState extends State<Oc> with TickerProviderStateMixin {
  OcState(this.controller);
  final SimpleHiddenDrawerBloc controller;
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
    _hide = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 350),
    );
    _hide.forward();
  }

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
                    margin:const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: Text(
                      translate(context, 'discount_offers'),
                      style:  TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding:const EdgeInsets.fromLTRB(10, 10, 0, 0),
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
            shape:  RoundedRectangleBorder(
              borderRadius:  BorderRadius.circular(100),
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
                  : ShopList(Shop.movieData),
            )
          ],
        ),
        bottomNavigationBar: SizeTransition(
          sizeFactor: _hide,
          child: BottomContent(),
        ),
      ),
    );
  }
}
