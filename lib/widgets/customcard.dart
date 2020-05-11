import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:login_page_customized/models/merchant.dart';
import '../counter.dart';
import '../models/shop.dart';
import '../functions.dart';
import '../env.dart' as env;
import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class ShopList extends StatefulWidget {
  const ShopList(this.movieData);
  final List<Data> movieData;
  @override
  _ShopListState createState() => _ShopListState(movieData);
}

class _ShopListState extends State<ShopList> {
  _ShopListState(this.movieData);
  final List<Data> movieData;
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  MyCounter bolc;
  @override
  void initState() {
    super.initState();
  }

  Future<void> _onRefresh() async {
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  Future<void> _onLoading() async {
    await Future<void>.delayed(const Duration(milliseconds: 1000));
    if (mounted) {
      setState(() {});
      _refreshController.loadComplete();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header:const WaterDropMaterialHeader(
          color: Colors.white,
          offset: 00,
        ),
        // WaterDropHeader(waterDropColor: Colors.orange,),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body = const Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body =const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body = const Text("Load Failed!Click retry!");
            } else if (mode == LoadStatus.canLoading) {
              body =const Text("release to load more");
            } else {
              body =const Text("No more Data");
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
          itemBuilder: (BuildContext context, int index) {
            return AnimatedCard(
              direction: AnimatedCardDirection.left,
              initDelay: const Duration(milliseconds: 0),
              duration: const Duration(seconds: 1),
              curve: Curves.ease,
              child: _itemBuilder(context, movieData.elementAt(index)),
            );
          },
        ));
  }

  Widget _itemBuilder(BuildContext context, Data shop) {
    const String text = "4";
   const String text2 = "5";
    return InkWell(
      onTap: () {

      },
      child: Card(
        shape: const RoundedRectangleBorder(
          borderRadius:  BorderRadius.only(
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
                  image:  AssetImage(
                    shop.logo??"assets/images/shoptwo.jpg",
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child:  Stack(children: <Widget>[
                 Positioned(
                  left: 0.0,
                  top: 1.0,
                  child:  IconButton(
                    color: env.mainColor,
                    icon:  Image.asset(
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
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24, vertical: 4),
                                decoration: BoxDecoration(
                                    borderRadius:
                                       const BorderRadius.all(Radius.circular(12)),
                                    color: Colors.grey[300]),
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
                              textAlign: TextAlign.center,
                            ),
                           const SizedBox(height: 7),
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
