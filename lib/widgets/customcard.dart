import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:login_page_customized/models/shop.dart';
import 'package:provider/provider.dart';
import 'package:login_page_customized/functions.dart';

import 'package:login_page_customized/env.dart' as env;
import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShopList extends StatefulWidget {
  final List<Shop> movieData;

  const ShopList(this.movieData);
  @override
  _ShopListState createState() => _ShopListState(movieData);
}

class _ShopListState extends State<ShopList> {
  final List<Shop> movieData;

  _ShopListState(this.movieData);
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  var bolc;
  @override
  initState() {
    super.initState();
  }

  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    print("am i refreshing ???????????");
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    print("am i loading ???????????");
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropMaterialHeader(
          color: Colors.white,
          offset: 00,
        ),
        // WaterDropHeader(waterDropColor: Colors.orange,),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body = CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body = Text("release to load more");
            } else {
              body = Text("No more Data");
            }
            return Container(
              height: 55.0,
              child: Center(child: body),
            );
          },
        ),
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView.builder(
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
        ));
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
            Container(
              color: Colors.white,
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
                          Text(translate(context, 'city'), style: env.mylight),
                          Row(
                            children: <Widget>[
                              Text(translate(context, 'branches_number'),
                                  style: env.mystyle),
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 24,vertical: 4 ),
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(12)),
                                    color: Colors.white),
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
                      Flexible(
                        child: Column(
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
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
