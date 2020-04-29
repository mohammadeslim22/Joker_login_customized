import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_page_customized/functions.dart';
import 'package:login_page_customized/env.dart' as env;
import 'package:login_page_customized/widgets/setting_bottombar.dart';

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
  @override
  Widget build(BuildContext context) {
    String dropdownValue = 'كتم';
    return Scaffold(
      appBar: new AppBar(
          centerTitle: true,
          title: Text(
            translate(context, "settings"),
            style: env.mystyle,
          )),
      body: new Column(
        // shrinkWrap: true,
        children: <Widget>[
          new Image(
            image: new AssetImage('assets/images/setting.png'),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * .35,
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Text(
                  translate(context, "font"),
                ),
                const SizedBox(
                  width: 15,
                ),
                const VerticalDivider(
              color: Colors.orange,
              width: 1,
            ),
        
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric( horizontal: 28),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  translate(context, "notification_sound"),
                ),
                const VerticalDivider(
                  color: Colors.blue,
                  width: 10,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.keyboard_arrow_down),
                  style: TextStyle(color: Colors.black),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items: <String>['كتم', 'صوت']
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 28),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  translate(context, "recieving_offers_notifies"),
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
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 28),
            color: Colors.white,
            child: Row(
              children: <Widget>[
                Text(
                  translate(context, "language"),
                )
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SettingBottom(),
    );
  }

  void switchChanged(bool value) {}
}
