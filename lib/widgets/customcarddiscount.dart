import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import '../models/discount.dart';
import '../functions.dart';
import '../env.dart' as env;
import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '_itemBuilder.dart';

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
    await Future.delayed(Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
  }

  void _onLoading() async {
    await Future.delayed(Duration(milliseconds: 1000));
    if (mounted) setState(() {});
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        // header: WaterDropMaterialHeader(
        //   color: Colors.white,
        //   offset: 00,
        // ),
        header: WaterDropHeader(waterDropColor: Colors.orange,),
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
          shrinkWrap: true,
          physics: ScrollPhysics(),
          padding: const EdgeInsets.all(20),
          itemCount: movieData.length,
          addRepaintBoundaries: true,
          itemBuilder: (context, index) {
            return AnimatedCard(
              direction: AnimatedCardDirection.left,
              initDelay: Duration(milliseconds: 0),
              duration: Duration(seconds: 1),
              curve: Curves.ease,
              child: ItemBuilder(
                  context: context, discount: movieData.elementAt(index)),
            );
          },
        ));
  }
}
