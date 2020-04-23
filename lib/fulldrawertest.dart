import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:login_page_customized/login_screen.dart';
import 'package:login_page_customized/octions.dart';
import 'package:login_page_customized/registrationscreen.dart';


class FullDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MyHomePage();
    
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<ScreenHiddenDrawer> itens = new List();

  @override
  void initState() {
    itens.add(new ScreenHiddenDrawer(
        new ItemHiddenMenu(
          name: "Screen 1",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.teal,
        ),
        LoginScreen()));

    itens.add(new ScreenHiddenDrawer(
      
        new ItemHiddenMenu(
          name: "Screen 2",
          baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 28.0 ),
          colorLineSelected: Colors.orange,
        ),
        Registration()));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return HiddenDrawerMenu(
      backgroundColorMenu: Colors.blueGrey,
      backgroundColorAppBar: Colors.cyan,
      screens: itens,

        //    typeOpen: TypeOpen.FROM_RIGHT,
        //    enableScaleAnimin: true,
        //    enableCornerAnimin: true,
        //    slidePercent: 80.0,
        //    verticalScalePercent: 80.0,
        //    contentCornerRadius: 10.0,
        //    iconMenuAppBar: Icon(Icons.menu),
        //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
        //    whithAutoTittleName: true,
        //    styleAutoTittleName: TextStyle(color: Colors.red),
        //    actionsAppBar: <Widget>[],
        //    backgroundColorContent: Colors.blue,
        //    elevationAppBar: 4.0,
        //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
        //    enableShadowItensMenu: true,
        //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
    );
    
  }
}