import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import '../models/discount.dart';
import '../functions.dart';
import '../env.dart' as env;
import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '_itemBuilder.dart';

class ShopDiscountList extends StatefulWidget {
  final List<Discount> movieData;

  const ShopDiscountList(this.movieData);
  @override
  _DiscountsListState createState() => _DiscountsListState(movieData);
}

class _DiscountsListState extends State<ShopDiscountList> {
  final List<Discount> movieData;

  _DiscountsListState(this.movieData);
  var bolc;
  @override
  initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
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
    );
  }
}
