import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
class Octions extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MyOctionState();
  }
}

class MyOctionState extends State<Octions> with SingleTickerProviderStateMixin {
  int _currentIndex = 0;

  List<Widget> _tabList = [
    Container(
      color: Colors.teal,
    ),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.purple,
    )
  ];

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _tabList.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> container = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Widget texCity() {
      return Padding(
        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(children: <Widget>[
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Text(
                  "عروض الخصومات",
                  style: new TextStyle(
                    fontSize: 25.0,

                    fontFamily: "Almarai",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Text(
                  "في المملكة العربية السعودية",
                  style: new TextStyle(
                      fontSize: 15.0,
                      
                      fontWeight: FontWeight.w100,
                      fontFamily: "Almarai"),
                ),
              )
            ]),
            const SizedBox(width: 40,),
            Padding(
              
                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: Container(
                    key: container,
                    alignment: Alignment.center,
                    width: 130,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(100.0),
                      ),
                     
                    ),
                    child: RaisedButton(
                     shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.orange)),
                      color: Colors.transparent,
                      elevation: 0,
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text("filter"),
                          IconButton(icon: Icon(Icons.local_grocery_store), onPressed: null)
                        ],
                      ),
                    )))
            // )
          ],
        ),
      );
    }

    return new  Scaffold(
          key: scaffoldKey,
         
          appBar: AppBar(
            centerTitle: true,
           
            leading: IconButton(
              iconSize: 40,
              icon: Icon(Icons.sort),
              onPressed: () => scaffoldKey.currentState.openDrawer(),
            ),
            actions: <Widget>[
              IconButton(
                iconSize: 30,
                icon: Icon(Icons.search),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
              IconButton(
                iconSize: 30,
                icon: Icon(Icons.tune),
                onPressed: () => scaffoldKey.currentState.openDrawer(),
              ),
            ],
            elevation: 0.0,
          ),
          body: Column(
            children: <Widget>[
              texCity(),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentIndex,
            onTap: (currentIndex) {
              setState(() {
                _currentIndex = currentIndex;
              });

              _tabController.animateTo(_currentIndex);
            },
            items: [
              BottomNavigationBarItem(
                  title: Text("Home"), icon: Icon(Icons.home)),
              BottomNavigationBarItem(
                  title: Text("Files"), icon: Icon(Icons.folder)),
              BottomNavigationBarItem(
                  title: Text("Settings"), icon: Icon(Icons.settings))
            ],
          ),
          drawer: Drawer(
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: ListView(
                  children: <Widget>[
                    DrawerHeader(
                      child: Text('Drawer Header'),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                    ),
                    ListTile(
                      title: Text('Item 1'),
                      onTap: () {
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => Octions(),
                        ));
                      },
                    ),
                    ListTile(
                      title: Text('Item 2'),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
  }
}
