import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../functions.dart';
import '../env.dart' as env;
import '../widgets/bottom_bar.dart';
import '../widgets/favoritetab_bar.dart';
import '../widgets/setting_bottombar.dart';
import 'package:provider/provider.dart';

import '../counter.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingsScreen();
  }
}

class SettingsScreen extends StatefulWidget {
  SettingsScreen({Key key}) : super(key: key);

  @override
  MySettingState createState() => new MySettingState();
}

class MySettingState extends State<SettingsScreen>
    with SingleTickerProviderStateMixin {
      String dropdownValue = 'كتم';
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          title: Text(
            translate(context, "settings"),
            style: env.mystyle,
          )),
      body: new ListView(
        shrinkWrap: true,
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/images/setting.png'),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .35,
          ),
          // without sperating line
          Container(
            padding:EdgeInsets.symmetric( horizontal: 10),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Text(
                    translate(context, "font"),
                    style: env.mystyle,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Flexible(
                    fit: FlexFit.tight,
                    child: Container(child: fontBar(context)),
                  )
                ],
              )),
          //wit hsperating line
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.start,
          //   children: <Widget>[
          //     Container(
          //       padding:
          //           const EdgeInsets.symmetric(vertical: 16, horizontal: 10),
          //       color: Colors.white,
          //       child: Text(
          //         translate(context, "font"),
          //         style: env.mystyle,
          //       ),
          //     ),
          //     const SizedBox(
          //       width: 3,
          //     ),
          //     Flexible(
          //       fit: FlexFit.tight,
          //       child: Container(color: Colors.white, child: fontBar(context)),
          //     )
          //   ],
          // ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  translate(context, "notification_sound"),
                  style: env.mystyle,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  style: TextStyle(color: Colors.black),
                  items: <String>['كتم', 'صوت']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  translate(context, "recieving_offers_notifies"),
                  style: env.mystyle,
                ),
                new Switch(
                  activeColor: Colors.orange,
                  onChanged: switchChanged,
                  value: true,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Text(
                  translate(context, "language"),
                  style: env.mystyle,
                ),
                Flexible(child: Container(child: languagBar(context)))
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      bottomNavigationBar: SettingBottom(),
    );
  }

  void switchChanged(bool value) {}
}

Widget fontBarChoice(BuildContext context, String choice, int index, List list,
    String category) {
  final bolc = Provider.of<MyCounter>(context);
  return Flexible(
      child: FlatButton(
          textColor: Colors.black,
          disabledColor: Colors.grey,
          padding: const EdgeInsets.all(0),
          splashColor: env.trans,
          highlightColor: env.trans,
          onPressed: () {
            if (category == "font")
              bolc.changefontindex(index);
            else
              bolc.changelanguageindex(index);
          },
          child: Column(
            children: <Widget>[
              Text(
                translate(context, choice),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 3,
              ),
              AnimatedOpacity(
                  opacity: list[index] ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 800),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(12),
                            topRight: Radius.circular(12)),
                        color: Colors.orange),
                    alignment: Alignment.bottomCenter,
                    height: 3,
                    width: MediaQuery.of(context).size.width * .15,
                  ))
            ],
          )));
}

Widget fontBar(BuildContext context) {
  final bolc = Provider.of<MyCounter>(context);
  return Container(
    child: Row(
      children: <Widget>[
        fontBarChoice(context, "large", 0, bolc.fontlist, "font"),
        verticalDiv(),
        fontBarChoice(context, "meduim", 1, bolc.fontlist, "font"),
        verticalDiv(),
        fontBarChoice(context, "small", 2, bolc.fontlist, "font"),
      ],
    ),
  );
}

Widget languagBar(BuildContext context) {
  final bolc = Provider.of<MyCounter>(context);
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        fontBarChoice(context, "arabic", 0, bolc.language, "language"),
        verticalDiv(),
        fontBarChoice(context, "english", 1, bolc.language, "language"),
        verticalDiv(),
        fontBarChoice(context, "turkish", 2, bolc.language, "language"),
      ],
    ),
  );
}

Widget verticalDiv() {
  return Container(
    child: const VerticalDivider(
      color: Colors.grey,
      thickness: 1,
    ),
    height: 18,
  );
}
