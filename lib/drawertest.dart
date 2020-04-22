import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:login_page_customized/registrationscreen.dart';
import 'package:provider/provider.dart';
import 'package:login_page_customized/functions.dart';

import 'customcard.dart';
import 'env.dart' as env;
import 'appbarIcon.dart';
import 'bottom_bar.dart';
import 'counter.dart';
import 'env.dart';

import 'login_screen.dart';
import 'movie.dart';

class MyDrawe extends StatefulWidget {
  @override
  _MyDraweState createState() => _MyDraweState();
}

class _MyDraweState extends State<MyDrawe> with SingleTickerProviderStateMixin {
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
      duration: Duration(milliseconds: 350),
    );
    _hide.forward();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();


  @override
  Widget build(BuildContext context) {
    final bolc = Provider.of<MyCounter>(context);

    Widget texCity() {
      return Container(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
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
            const SizedBox(
              width: 40,
            ),
            // here its wac a Card
            RaisedButton(
              color: Colors.white,
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(100),
              ),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                child: Row(
                  children: <Widget>[
                    Text(
                      translate(context, 'flitring'),
                      style: env.mystyle,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    new Container(
                      color: env.trans,
                      child: new Image.asset(
                        "assets/images/filter.png",
                        height: 25,
                        width: 25,
                      ),
                    ),
                    // IconButton(icon: Icon(Icons.tune), onPressed: null)
                  ],
                ),
              ),
              onPressed: () {},
            ),
          ],
        ),
      );
    }

    return SimpleHiddenDrawer(
      key:scaffoldKey ,
      verticalScalePercent: 60,
      contentCornerRadius: 30,
      enableCornerAnimin: true,
      enableScaleAnimin: true,
      isDraggable: true,
     // typeOpen: TypeOpen.FROM_RIGHT,
      menu: Menu(),
      screenSelectedBuilder: (position, controller) {
        return NotificationListener<ScrollNotification>(
            onNotification: _handleScrollNotification,
            child: Scaffold(
              key: scaffoldKey,
              appBar: AppBar(
                backgroundColor: env.trans,
                leading: AppBarIcon(scaffoldKey: scaffoldKey,contrller:controller, icon: Icons.sort),
                actions: <Widget>[
                  AppBarIcon(scaffoldKey: scaffoldKey, icon: Icons.search),
                  AppBarIcon(
                      scaffoldKey: scaffoldKey, icon: Icons.notifications_none),
                ],
                elevation: 0.0,
              ),
              body: Column(
                children: <Widget>[
                  texCity(),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: DiscountsList(Movie.movieData),
                  )
                ],
              ),
              bottomNavigationBar: SizeTransition(
                sizeFactor: _hide,
                child: BottomContent(currentIndex: bolc.bottomNavIndex),
              ),
            ));
      },
    );
  }
}

class Menu extends StatefulWidget {
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.centerRight,
      width: double.maxFinite,
      height: double.maxFinite,
      color: Colors.cyan,
      padding: const EdgeInsets.all(8.0),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              SimpleHiddenDrawerProvider.of(context).setSelectedMenuPosition(0);
            },
            child: Text("Menu 1"),
          ),
          RaisedButton(
              onPressed: () {
                SimpleHiddenDrawerProvider.of(context)
                    .setSelectedMenuPosition(1);
              },
              child: Text("Menu 2"))
        ],
      ),
    );
  }
}
