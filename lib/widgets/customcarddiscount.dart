import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:login_page_customized/counter.dart';
import '../models/discount.dart';
import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '_itemBuilder.dart';

class DiscountsList extends StatefulWidget {
  const DiscountsList(this.movieData);
  final List<Discount> movieData;
  @override
  _DiscountsListState createState() => _DiscountsListState(movieData);
}

class _DiscountsListState extends State<DiscountsList> {
  _DiscountsListState(this.movieData);
  final List<Discount> movieData;
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
    if (mounted){
    setState(() {});
    _refreshController.loadComplete();
  }}

  @override
  Widget build(BuildContext context) {
    return SmartRefresher(
        enablePullDown: true,
        enablePullUp: true,
        header: const WaterDropHeader(
          waterDropColor: Colors.orange,
        ),
        footer: CustomFooter(
          builder: (BuildContext context, LoadStatus mode) {
            Widget body;
            if (mode == LoadStatus.idle) {
              body =const Text("pull up load");
            } else if (mode == LoadStatus.loading) {
              body =const CupertinoActivityIndicator();
            } else if (mode == LoadStatus.failed) {
              body =const Text("Load Failed!Click retry!");
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
          shrinkWrap: true,
          physics:const ScrollPhysics(),
          padding: const EdgeInsets.all(20),
          itemCount: movieData.length,
          addRepaintBoundaries: true,
          itemBuilder: (BuildContext context,int index) {
            return AnimatedCard(
              direction: AnimatedCardDirection.left,
              initDelay:const Duration(milliseconds: 0),
              duration: const  Duration(seconds: 1),
              curve: Curves.ease,
              child: ItemBuilder(
                  context: context, discount: movieData.elementAt(index)),
            );
          },
        ));
  }
}
