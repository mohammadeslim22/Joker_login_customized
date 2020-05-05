import 'package:animated_card/animated_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../models/membership.dart';
import '../env.dart' as env;
import '../functions.dart';

class MyMemberShip extends StatefulWidget {
  const MyMemberShip(this.membershipsData);
  final List<MemberShip> membershipsData;
  @override
  MyMemberShipState createState() => MyMemberShipState(membershipsData);
}

class MyMemberShipState extends State<MyMemberShip>
    with SingleTickerProviderStateMixin {
  MyMemberShipState(this.membershipsData);
  final List<MemberShip> membershipsData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          translate(context, "my_membership"),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20),
        itemCount: membershipsData.length,
        addRepaintBoundaries: true,
        itemBuilder: (BuildContext context, int index) {
          return AnimatedCard(
            direction: AnimatedCardDirection.left,
            initDelay:const Duration(milliseconds: 0),
            duration:const Duration(seconds: 1),
            curve: Curves.ease,
            child: _itemBuilder(context, membershipsData.elementAt(index)),
          );
        },
      ),
    );
  }

  Widget _itemBuilder(BuildContext context, MemberShip memberShip) {
    return Card(
        shape:const RoundedRectangleBorder(
          borderRadius:  BorderRadius.all(Radius.circular(12)),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(12, 8, 4, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Flexible(
                child: Column(
                  children: <Widget>[
                    FloatingActionButton(
                        mini: true,
                        heroTag: memberShip.shopName,
                        elevation: 0,
                        backgroundColor: env.trans,
                        onPressed: () {},
                        child:  Image.asset("assets/images/membership.png")),
                    Text(
                      memberShip.type,
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              Container(
                child: const VerticalDivider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                height: 45,
              ),
              Column(
                children: <Widget>[
                  Text(
                    translate(context, 'shop_name'),
                    style: env.underHead,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "${memberShip.startingDate}".split(' ')[0],
                        style: env.mysmall,
                      ),
                      Icon(Icons.arrow_forward, color: Colors.orange, size: 12),
                      Text("${memberShip.endDtae}".split(' ')[0],
                          style: env.mysmall),
                    ],
                  )
                ],
              ),
              Flexible(
                  child: Image.asset(
                memberShip.image,
                scale: 2,
              ))
            ],
          ),
        ));
  }
}
