import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/provider/simple_hidden_drawer_provider.dart';
import 'package:provider/provider.dart';

import 'package:login_page_customized/screens/octions.dart';
import 'package:login_page_customized/counter.dart';
import 'package:login_page_customized/functions.dart';
import 'package:login_page_customized/env.dart' as env;

class BottomContent extends StatelessWidget {
  const BottomContent({
    this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    final bolc = Provider.of<MyCounter>(context);

    return Container(
      color: Colors.black,
      height: 60,
      width: MediaQuery.of(context).size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            child: RaisedButton(
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
                      bolc.bottomNavIndex == 0
                          ? "assets/images/discounts.png"
                          : "assets/images/lightoffdiscount.png",
                      height: bolc.bottomNavIndex == 1 ? 20 : 25,
                      width: bolc.bottomNavIndex == 1 ? 25 : 35,
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
                    color: bolc.bottomNavIndex == 0 ? Colors.orange : env.trans,
                  )
                ],
              ),
              onPressed: () {
                if (bolc.bottomNavIndex == 0) {
                } else {
                  bolc.changebottomNavIndex(0);
                }
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: const VerticalDivider(
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
                    bolc.bottomNavIndex == 0
                        ? "assets/images/lightoffshop.png"
                        : "assets/images/shop.png",
                    height: bolc.bottomNavIndex == 0 ? 20 : 25,
                    width: bolc.bottomNavIndex == 0 ? 25 : 35,
                    scale: bolc.bottomNavIndex == 0 ? .8 : 1,
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
                  color: bolc.bottomNavIndex == 1 ? Colors.orange : env.trans,
                )
              ],
            ),
            onPressed: () {
              if (bolc.bottomNavIndex == 1) {
              } else {
                bolc.changebottomNavIndex(1);
              }
            },
          ),
        ],
      ),
    );
  }
}
