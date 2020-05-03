import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hidden_drawer_menu/simple_hidden_drawer/provider/simple_hidden_drawer_provider.dart';
import 'package:provider/provider.dart';

import 'package:login_page_customized/screens/octions.dart';
import 'package:login_page_customized/counter.dart';
import 'package:login_page_customized/functions.dart';
import 'package:login_page_customized/env.dart' as env;

class FavoritBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final bolc = Provider.of<MyCounter>(context);
    return Container(
      color: Colors.grey[100],
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
              child: FlatButton(
                  textColor: Colors.black,
                  disabledColor: Colors.grey,
                  padding: EdgeInsets.all(18.0),
                  splashColor: env.trans,
                  highlightColor: env.trans,
                  onPressed: () {
                    bolc.changeTabBarIndex(1);

                    print("what the fuck ");
                  },
                  child: Column(
                    children: <Widget>[
                      Text(
                        translate(context, 'stores'),
                        style: env.underHeadblack,
                      ),
                      AnimatedOpacity(
                          opacity: bolc.visible1 ? 1.0 :0.0,
                          duration: Duration(milliseconds: 700),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                                   color:Colors.orange
                              // color: bolc.visible1 == true
                              //     ? Colors.orange
                              //     : env.trans,
                            ),
                            alignment: Alignment.bottomCenter,
                            height: 5,
                            width: MediaQuery.of(context).size.width * .4,
                          ))
                    ],
                  ))),
          Container(
            child: const VerticalDivider(
              color: Colors.grey,
              thickness: 1,
            ),
            height: 28,
          ),
          Flexible(
              child: FlatButton(
                  textColor: Colors.black,
                  disabledColor: Colors.grey,
                  padding: EdgeInsets.all(18.0),
                  splashColor: env.trans,
                  highlightColor: env.trans,
                  onPressed: () {
                    bolc.changeTabBarIndex(0);
                  },
                  child: Column(
                    children: <Widget>[
                      Text(
                        translate(context, 'discounts'),
                        style: env.underHeadblack,
                      ),
                      AnimatedOpacity(
                          opacity: bolc.visible2 ? 1.0 : 0.0,
                          duration: Duration(milliseconds: 800),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topLeft: Radius.circular(12),
                                  topRight: Radius.circular(12)),
                                  color:Colors.orange
                              // color: bolc.visible2 == true
                              //     ? Colors.orange
                              //     : env.trans,
                            ),
                            alignment: Alignment.bottomCenter,
                            height: 5,
                            width: MediaQuery.of(context).size.width * .4,
                          ))
                    ],
                  ))),
        ],
      ),
    );
  }
}
