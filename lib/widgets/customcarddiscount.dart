import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:login_page_customized/models/discount.dart';
import 'package:login_page_customized/functions.dart';
import 'package:login_page_customized/env.dart' as env;
import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class DiscountsList extends StatefulWidget {
  final List<Discount> movieData;

  const DiscountsList(this.movieData);
  @override
  _DiscountsListState createState() => _DiscountsListState(movieData);
}

class _DiscountsListState extends State<DiscountsList> {
  final List<Discount> movieData;

  _DiscountsListState(this.movieData);
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
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    // if failed,use loadFailed(),if no data return,use LoadNodata()

    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: WaterDropHeader(
          waterDropColor: Colors.orange,
        ),
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

  Widget _itemBuilder(BuildContext context, Discount discount) {
    String text = "الكل";
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
                    discount.image,
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width * .5,
                          child: Text(
                            "اسم العرض الطويل جدا ولو كان اطول من هيك ",
                            style: env.underHead,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "running",
                              overflow: TextOverflow.ellipsis,
                              style: env.mylight,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: discount.display,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(100))),
                              width: 10,
                              height: 10,
                            )
                          ],
                        )
                      ]),
                  const SizedBox(height: 8),
                  Text(translate(context, 'discount_type'), style: env.mylight),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Icon(
                                  Icons.store_mall_directory,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Flexible(
                                  child: Container(
                                    width: MediaQuery.of(context).size.width * .3,
                                    child: Text(
                                      "متجر كابيتال مول مترج كابيتال مول ",
                                      overflow: TextOverflow.ellipsis,
                                      style: env.mystyle,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Text(translate(context, 'branch'),
                                    style: env.mylight),
                                const SizedBox(
                                  width: 10,
                                ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 4 ),
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
                      ),
                      Column(
                        children: <Widget>[
                          Text(
                            translate(context, 'starting_date'),
                            style: env.mysmalllight,
                          ),
                          const SizedBox(height: 7),
                          Text(
                            discount.startingDate,
                            style: env.mystyle,
                          )
                        ],
                      ),
                      const SizedBox(width: 5,),
                      Column(
                        children: <Widget>[
                          Text(
                            translate(context, 'end_date'),
                            style: env.mysmalllight,
                          ),
                          const SizedBox(height: 7),
                            Text(
                            discount.endDtae,
                            style: env.mystyle,
                            )
                        ],
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
