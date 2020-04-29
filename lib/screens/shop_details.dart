import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page_customized/functions.dart';
import 'package:login_page_customized/env.dart' as env;
import 'package:login_page_customized/models/shop.dart';
import 'package:like_button/like_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ShopDetails extends StatefulWidget {
  final Shop shop;
  final int likecount;
  final int lovecount;

  const ShopDetails({Key key, this.shop, this.likecount, this.lovecount})
      : super(key: key);
  @override
  _MyHomePageState createState() =>
      _MyHomePageState(shop, likecount, lovecount);
}

class _MyHomePageState extends State<ShopDetails>
    with TickerProviderStateMixin {
  _MyHomePageState(this.shop, this.likecount, this.lovecount);
  final Shop shop;
  final int likecount;
  final int lovecount;
  String text2 = "5";
  var text = "4";
  Color floatingbuttonCo = Colors.grey;

  Future<bool> onLikeButtonTapped(bool isLiked) async {
    return !isLiked;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text(
          translate(context, "shop_details"),
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        shrinkWrap: true,
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * .25,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12), topRight: Radius.circular(12)),
              image: DecorationImage(
                image: new AssetImage(
                  shop.image,
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    translate(context, 'shop_name'),
                    style: env.underHead,
                  ),
                       const SizedBox(
                        height: 6,
                      ),
                  Text(translate(context, 'city'), style: env.mylight),
                ],
              ),
              Row(
                children: <Widget>[
                  Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        LikeButton(
                          size: 26,
                          likeBuilder: (bool isLiked) {
                            return Container(
                              child: FloatingActionButton(
                                elevation: 0,
                                backgroundColor:
                                    !isLiked ? Colors.grey : Colors.blue,
                                child: new Image.asset(
                                  "assets/images/like.png",
                                  scale: 3.5,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            );
                          },
                          likeCountPadding:
                              const EdgeInsets.symmetric(vertical: 3),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          countBuilder: (int c, bool b, String i) {
                            return Text(
                              i,
                              style: TextStyle(color: Colors.black),
                            );
                          },
                          likeCount: lovecount,
                          countPostion: CountPostion.bottom,
                          circleColor: CircleColor(
                              start: Colors.white, end: Colors.purple),
                          onTap: (bool loved) {
                            return onLikeButtonTapped(loved);
                          },
                        ),

                        // Container(
                        //   width: 27.0,
                        //   height: 25.0,
                        //   child: FloatingActionButton(
                        //     elevation: 0,
                        //     backgroundColor: floatingbuttonCo,
                        //     mini: true,
                        //     child: new Image.asset(
                        //       "assets/images/like.png",
                        //       scale: 3.5,
                        //       fit: BoxFit.cover,
                        //     ),
                        //     onPressed: () {
                        //       setState(() {
                        //         floatingbuttonCo = Colors.blue[300];
                        //       });
                        //     },
                        //   ),
                        // ),
                        // const SizedBox(
                        //   height: 2,
                        // ),
                        // Text(
                        //   likecount.toString(),
                        //   style: env.mystyle,
                        // ),
                        // const SizedBox(
                        //   height: 7,
                        // ),
                      ]),
                  SizedBox(width: 7),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      LikeButton(
                        size: 31,
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        countBuilder: (int c, bool b, String i) {
                          return Text(
                            i,
                            style: TextStyle(color: Colors.black),
                          );
                        },
                        isLiked: true,
                        likeCount: lovecount,
                        countPostion: CountPostion.bottom,
                        circleColor: CircleColor(
                            start: Colors.white, end: Colors.purple),
                        onTap: (bool loved) {
                          return onLikeButtonTapped(loved);
                        },
                        likeCountPadding:
                            const EdgeInsets.symmetric(vertical: 0),
                      ),
                      const SizedBox(
                        height: 6,
                      )
                    ],
                  ),
                ],
              ),
            ],
          ),
        
        ],
      ),
    );
  }
}
