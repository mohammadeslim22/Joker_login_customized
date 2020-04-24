import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/provider/simple_hidden_drawer_provider.dart';
import 'package:provider/provider.dart';

import 'Octions.dart';
import 'counter.dart';
import 'functions.dart';
import 'env.dart' as env;

class BottomContent extends StatelessWidget {
  const BottomContent({
    this.currentIndex,
    //this.c,
  });

  final int currentIndex;
  //final BuildContext c;

  @override
  Widget build(BuildContext context) {
    final bolc = Provider.of<MyCounter>(context);
    print("%%%%%%%%%%%%%%%%%$currentIndex");
    return Container(
      color: Colors.black,
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          RaisedButton(
            color: env.trans,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(
                  height: 2,
                ),
                new Container(
                  color: env.trans,
                  child: new Image.asset(
                    currentIndex == 0
                        ? "assets/images/discounts.png"
                        : "assets/images/lightoffdiscount.png",
                    height: currentIndex == 1 ? 20 : 25,
                    width: currentIndex == 1 ? 25 : 35,
                  ),
                ),
                const SizedBox(
                  height: 2,
                ),
                Text(
                  translate(context, 'discounts'),
                  style: env.mylight,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 2,
                  width: MediaQuery.of(context).size.width * .4,
                  color: currentIndex == 0 ? Colors.orange : env.trans,
                )
              ],
            ),
            onPressed: () {
              //                   SimpleHiddenDrawerProvider.of(context).toggle();

              if (currentIndex == 0) {
              } else {
                SimpleHiddenDrawerProvider.of(context)
                    .setSelectedPosition(0);
                bolc.changebottomNavIndex();
              }
            },
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: VerticalDivider(
              color: Colors.orange,
              width: 1,
            ),
          ),
          RaisedButton(
            color: env.trans,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                const SizedBox(
                  height: 5,
                ),
                new Container(
                  color: env.trans,
                  child: new Image.asset(
                    currentIndex == 0
                        ? "assets/images/lightoffshop.png"
                        : "assets/images/shop.png",
                    height: currentIndex == 0 ? 20 : 25,
                    width: currentIndex == 0 ? 25 : 35,
                    scale: currentIndex == 0 ? .8 : 1,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  translate(context, 'stores'),
                  style: env.mylight,
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 2,
                  width: MediaQuery.of(context).size.width * .4,
                  color: currentIndex == 1 ? Colors.orange : env.trans,
                )
              ],
            ),
            onPressed: () {
              if (currentIndex == 1) {
              } else {
                SimpleHiddenDrawerProvider.of(context)
                    .setSelectedPosition(1);
                bolc.changebottomNavIndex();
              }
            },
          ),
        ],
      ),
    );
  }
}
