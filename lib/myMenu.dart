import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/hidden_drawer/hidden_drawer_menu.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'env.dart' as env;
import 'package:login_page_customized/functions.dart';

class MenuScreen extends StatelessWidget {
  final String imageUrl =
      "https://celebritypets.net/wp-content/uploads/2016/12/Adriana-Lima.jpg";

  MenuScreen({Key key}) : super(key: key);

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
      ),
      MenuItem(
        Icons.shopping_basket,
        translate(context, 'my_account'),
        Colors.red,
        new Image.asset(
          "assets/images/myaccount.png",
          height: 25,
          width: 25,
        ),
      ),
      MenuItem(
        Icons.favorite,
        translate(context, 'my_membership'),
        Colors.grey,
        new Image.asset(
          "assets/images/membership.png",
          height: 25,
          width: 25,
        ),
      ),
      MenuItem(
        Icons.code,
        translate(context, 'settings'),
        Colors.red,
        new Image.asset(
          "assets/images/settings.png",
          height: 25,
          width: 25,
        ),
      ),
      MenuItem(
        Icons.format_list_bulleted,
        translate(context, 'rules'),
        Colors.lightGreen,
        new Image.asset(
          "assets/images/termsandconditions.png",
          height: 25,
          width: 25,
        ),
      ),
      MenuItem(
        Icons.format_list_bulleted,
        translate(context, 'tech_support'),
        Colors.green,
        new Image.asset(
          "assets/images/tech_support.png",
          height: 25,
          width: 25,
        ),
      ),
    ];
    return GestureDetector(
        onTap: () {
          SimpleHiddenDrawerProvider.of(context).toggle();
        },
        onPanUpdate: (details) {
          if (details.delta.dx < 3 || details.delta.dx < -3) {
            SimpleHiddenDrawerProvider.of(context).toggle();
          }
        },
        child: Scaffold(
          backgroundColor: Color(0xFFFAFAFA),
          body: Container(
            padding: EdgeInsets.only(top: 55, left: 8, bottom: 16, right: 8),
            child: Column(
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
                          child: CircularImage(
                            CachedNetworkImage(
                              imageUrl: imageUrl,
                              imageBuilder: (context, imageProvider) =>
                                  Container(
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
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Spacer(),
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
                              child: Row(children: <Widget>[
                            FloatingActionButton(
                                backgroundColor: item.backgroundcolor[100],
                                onPressed: () {},
                                child: item.image),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(item.title, style: env.underHead),
                              ]),
                              onPressed: () {},
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  }).toList(),
                ),
                Spacer(),
                Row(children: <Widget>[
                  const SizedBox(
                    width: 18,
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    child: new Image.asset(
                      "assets/images/logout.png",
                      height: 25,
                      width: 25,
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
  final Function func;

  MenuItem(this.icon, this.title, this.backgroundcolor, this.image, 
      {this.notifiesNo,this.func,});
}

class CircularImage extends StatelessWidget {
  final double _width, _height;
  final CachedNetworkImage image;

  CircularImage(this.image, {double width = 80, double height = 80})
      : _width = width,
        _height = height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: _width,
      height: _height,
      child: image,
      decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
        BoxShadow(
          blurRadius: 10,
          color: Colors.black45,
        )
      ]),
    );
  }
}
