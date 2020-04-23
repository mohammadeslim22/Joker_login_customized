import 'package:flutter/rendering.dart';
import 'package:login_page_customized/shop.dart';
import 'package:provider/provider.dart';

import 'counter.dart';
import 'discount.dart';
import 'functions.dart';

import 'env.dart' as env;
import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';

class ShopList extends StatefulWidget {
  final List<Shop> movieData;

  const ShopList(this.movieData);
  @override
  _ShopListState createState() => _ShopListState(movieData);
}

class _ShopListState extends State<ShopList> {
  final List<Shop> movieData;

  _ShopListState(this.movieData);

  var bolc;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(20),
      itemCount: movieData.length,
      addRepaintBoundaries: true,
      itemBuilder: (context, index) {
        return AnimatedCard(
          direction: AnimatedCardDirection.left,
          initDelay: Duration(milliseconds: 0),
          duration: Duration(seconds: 1),
          curve: Curves.ease,
          child: _itemBuilder(context, movieData.elementAt(index)),
        );
      },
    );
  }

  Widget _itemBuilder(BuildContext context, Shop shop) {
    var text = "4";
    String text2 = "5";
    return InkWell(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(12), topRight: Radius.circular(12)),
        ),
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * .2,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                image: DecorationImage(
                  image: new AssetImage(
                    shop.image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: new Stack(children: <Widget>[
                new Positioned(
                  left: 0.0,
                  top: 1.0,
                  child: new IconButton(
                    color: env.mainColor,
                    icon: new Image.asset(
                      "assets/images/loveicon.png",
                      scale: 3,
                    ),
                    onPressed: () {},
                  ),
                ),
              ]),
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      translate(context, 'shop_name'),
                      style: env.underHead,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(translate(context, 'city'),
                                style: env.mylight),
                            Row(
                              children: <Widget>[
                                Text(translate(context, 'branches_number'),
                                    style: env.mystyle),
                                const SizedBox(
                                  width: 10,
                                ),
                                Container(
                                  padding: EdgeInsets.fromLTRB(24, 4, 24, 4),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Colors.grey[200],
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(
                                    text,
                                    style: env.mystyle,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                        Column(
                          children: <Widget>[
                            Text(
                              translate(context, 'current_sales'),
                              style: env.mylight,
                            ),
                            SizedBox(height: 7),
                            Text(
                              text2,
                              style: env.mystyle,
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
