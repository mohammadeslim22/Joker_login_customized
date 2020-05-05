import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';
import 'package:login_page_customized/counter.dart';
import '../models/discount.dart';
import 'package:flutter/material.dart';
import 'package:animated_card/animated_card.dart';
import '_itemBuilder.dart';

class ShopDiscountList extends StatefulWidget {
  const ShopDiscountList(this.movieData);
  final List<Discount> movieData;
  @override
  _DiscountsListState createState() => _DiscountsListState(movieData);
}

class _DiscountsListState extends State<ShopDiscountList> {
  _DiscountsListState(this.movieData);
  final List<Discount> movieData;
  MyCounter bolc;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const ScrollPhysics(),
      padding: const EdgeInsets.all(20),
      itemCount: movieData.length,
      addRepaintBoundaries: true,
      itemBuilder: (BuildContext context,int index) {
        return AnimatedCard(
          direction: AnimatedCardDirection.left,
          initDelay:const Duration(milliseconds: 0),
          duration: const Duration(seconds: 1),
          curve: Curves.ease,
          child: ItemBuilder(
              context: context, discount: movieData.elementAt(index)),
        );
      },
    );
  }
}
