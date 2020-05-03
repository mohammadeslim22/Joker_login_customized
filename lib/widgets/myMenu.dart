import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../env.dart' as env;
import '../functions.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key key}) : super(key: key);

  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  String notificationNo = "10";
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";
  @override
  Widget build(BuildContext context) {
    final bool isRTL = (Directionality.of(context) == TextDirection.rtl);
    final List<MenuItem> options = [
      MenuItem(
          Icons.notifications_none,
          translate(context, 'notifications'),
          Colors.yellow,
          new Image.asset(
            "assets/images/notification.png",
            height: 25,
            width: 25,
          ),
          backgroundcolortrans: env.trans,
          notifiesNo: FloatingActionButton(
            materialTapTargetSize: MaterialTapTargetSize.padded,
            splashColor: Colors.transparent,
            highlightElevation: 0,
            mini: true,
            backgroundColor: Color(0xFFFFC000),
            shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(100),
            ),
            child: Text(
              notificationNo,
              style: env.notificationNO,
            ),
            onPressed: () {},
          ),
          func: () {}),
      MenuItem(
          Icons.shopping_basket,
          translate(context, 'my_account'),
          Colors.red,
          new Image.asset(
            "assets/images/myaccount.png",
            height: 25,
            width: 25,
          ),
          func: () {}),
      MenuItem(
          Icons.favorite,
          translate(context, 'my_membership'),
          Colors.blueGrey,
          new Image.asset(
            "assets/images/membership.png",
            height: 25,
            width: 25,
          ),
          func: () {}),
      MenuItem(
          Icons.code,
          translate(context, 'settings'),
          Colors.orange,
          new Image.asset(
            "assets/images/settings.png",
            height: 25,
            width: 25,
          ),
          func: () {}),
      MenuItem(
          Icons.format_list_bulleted,
          translate(context, 'rules'),
          Colors.lightGreen,
          new Image.asset(
            "assets/images/termsandconditions.png",
            height: 25,
            width: 25,
          ),
          func: () {}),
      MenuItem(
          Icons.format_list_bulleted,
          translate(context, 'tech_support'),
          Colors.green,
          new Image.asset(
            "assets/images/tech_support.png",
            height: 25,
            width: 25,
          ),
          func: () {}),
    ];
    return GestureDetector(
        onTap: () {
          SimpleHiddenDrawerProvider.of(context).toggle();
        },
        child: Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 55, left: 8, bottom: 16, right: 8),
            child: ListView(
              shrinkWrap: true,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    const SizedBox(
                      width: 18,
                    ),
                    Stack(
                      overflow: Overflow.visible,
                      children: <Widget>[
                        Positioned.directional(
                          top: 10,
                          start: 60,
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 30),
                            width: 200,
                            height: 60,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  'رامي هاني الشاعر الشاعر',
                                  style: env.underHead,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                Text('الرياض', style: env.mylight),
                              ],
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFFFFFFF),
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(
                                color: Colors.white,
                                width: 2,
                              ),
                            ),
                          ),
                          textDirection:
                              isRTL ? TextDirection.rtl : TextDirection.ltr,
                        ),
                        Positioned(
                            child: CircleAvatar(
                          maxRadius: 40,
                          minRadius: 30,
                          child: CachedNetworkImage(
                            imageUrl: imageUrl,
                            imageBuilder: (context, imageProvider) => Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: imageProvider,
                                    fit: BoxFit.cover,
                                    colorFilter: ColorFilter.mode(
                                        Colors.white, BlendMode.colorBurn)),
                              ),
                            ),
                            placeholder: (context, url) =>
                                CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: options.map((item) {
                    return Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            RaisedButton(
                              splashColor: Colors.transparent,
                              highlightElevation: 0,
                              highlightColor: Colors.transparent,
                              color: env.trans,
                              elevation: 0,
                              child: Row(children: <Widget>[
                                FloatingActionButton(
                                    heroTag: item.title,
                                    elevation: 0,
                                    backgroundColor:
                                        item.backgroundcolortrans ??
                                            item.backgroundcolor[100],
                                    onPressed: () {},
                                    child: item.image),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(item.title, style: env.underHead),
                              ]),
                              onPressed: item.func,
                            ),
                            item.notifiesNo ?? Container()
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  }).toList(),
                ),
              const SizedBox(height: 20,),
                Row(children: <Widget>[
                  const SizedBox(
                    width: 18,
                  ),
                  FloatingActionButton(
                    backgroundColor: Colors.grey,
                    elevation: 0,
                    onPressed: () {},
                    child: new Image.asset(
                      "assets/images/logout.png",
                      height: 25,
                      width: 25,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(translate(context, 'sign_out'), style: env.underHead),
                ]),
              ],
            ),
          ),
        ));
  }
}

class MenuItem {
  String title;
  final Image image;
  IconData icon;
  final Widget notifiesNo;
  final MaterialColor backgroundcolor;
  final Color backgroundcolortrans;
  final Function func;

  MenuItem(
    this.icon,
    this.title,
    this.backgroundcolor,
    this.image, {
    this.notifiesNo,
    this.func,
    this.backgroundcolortrans,
  });
}
