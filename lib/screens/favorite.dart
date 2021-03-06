import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../functions.dart';
import '../models/discount.dart';
import '../models/shop.dart';
import '../widgets/customcard.dart';
import '../widgets/customcarddiscount.dart';
import '../widgets/favoritetab_bar.dart';
import 'package:provider/provider.dart';

import '../counter.dart';

class Favorite extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Favorite>
    with SingleTickerProviderStateMixin {
     
  @override
  Widget build(BuildContext context) {
        final MyCounter bolc = Provider.of<MyCounter>(context);

    return Scaffold(
      appBar:  AppBar(
          title: Text(
            translate(context, "fav"),
          ),
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize:const  Size.fromHeight(50.0), 
            child: FavoritBar(),
          )),
      // body: (bolc.favocurrentIndex == 0)
      //     ? DiscountsList(Discount.movieData)
      //     : ShopList(Shop.movieData),
    );
  }
}
