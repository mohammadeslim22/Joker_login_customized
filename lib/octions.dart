import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:hidden_drawer_menu/hidden_drawer/screen_hidden_drawer.dart';
import 'package:hidden_drawer_menu/menu/item_hidden_menu.dart';
import 'package:login_page_customized/functions.dart';
import 'package:login_page_customized/login_screen.dart';
import 'package:provider/provider.dart';
import 'appbarIcon.dart';
import 'bottom_bar.dart';
import 'counter.dart';
import 'env.dart' as env;
import 'customcard.dart';
import 'movie.dart';
import 'drawertest.dart';
import 'myMenu.dart';

class Octions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return  ChangeNotifierProvider(
          create: (context) => MyCounter(),
          child:OctionsScreen(),
          builder: (context) => MyCounter(),
        );
     
  }
}
class OctionsScreen extends StatefulWidget {
  OctionsScreen({Key key}) : super(key: key);

  @override
  MyOctionState createState() => new MyOctionState();
}

class MyOctionState extends State<OctionsScreen> with SingleTickerProviderStateMixin {
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

  @override
  void dispose() {
    super.dispose();
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
                      const SizedBox(width: 10,),
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
                ), onPressed: () {},),
          ],
        ),
      );
    }

    return NotificationListener<ScrollNotification>(
        onNotification: _handleScrollNotification,
        child: Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: env.trans,
            leading: AppBarIcon(scaffoldKey: scaffoldKey, icon: Icons.sort),
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
                child: SingleNewsCard(Movie.movieData),
              )
            ],
          ),
          bottomNavigationBar: SizeTransition(
            sizeFactor: _hide,
            child: BottomContent(currentIndex: bolc.bottomNavIndex),
          ),
         // drawer: MenuScreen(),
          
          // Drawer(
          //   child: SafeArea(
          //     child: Padding(
          //       padding: const EdgeInsets.all(18.0),
          //       child: ListView(
          //         children: <Widget>[
          //           DrawerHeader(
          //             child: Text('Drawer Header'),
          //             decoration: BoxDecoration(
          //               color: Colors.blue,
          //             ),
          //           ),
          //           ListTile(
          //             title: Text('Item 1'),
          //             onTap: () {
          //               Navigator.of(context).pushReplacement(MaterialPageRoute(
          //                 builder: (context) => Octions(),
          //               ));
          //             },
          //           ),
          //           ListTile(
          //             title: Text('Item 2'),
          //             onTap: () {},
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ));
  }
}

