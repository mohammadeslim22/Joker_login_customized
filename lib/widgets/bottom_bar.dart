import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../counter.dart';
import '../functions.dart';
import '../env.dart' as env;

class BottomContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final  MyCounter bolc = Provider.of<MyCounter>(context);

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
                   Container(
                    color: env.trans,
                    child:  Image.asset(
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
         const Padding(
            padding:  EdgeInsets.symmetric(vertical: 12),
            child:  VerticalDivider(
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
                 Container(
                  color: env.trans,
                  child:  Image.asset(
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
