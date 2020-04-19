import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:login_page_customized/functions.dart';
import 'package:provider/provider.dart';
import 'counter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'env.dart' as env;
import 'package:timer_count_down/timer_count_down.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PinCode extends StatelessWidget {
  final String monileNo;

  const PinCode({Key key, this.monileNo}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return LoginScreenPage(monileNo: monileNo);
  }
}

class LoginScreenPage extends StatefulWidget {
  final String monileNo;
  LoginScreenPage({Key key, this.monileNo}) : super(key: key);

  @override
  _MyHomePageState createState() => new _MyHomePageState(monileNo);
}

class _MyHomePageState extends State<LoginScreenPage>
    with TickerProviderStateMixin {
  AnimationController controller;
  final String monileNo;
  String currentText = "0000";
  bool showTimer = true;
  _MyHomePageState(this.monileNo);

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 30),
    );
  }

  Widget pinCode() {
    return Container(
        margin: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
        padding: const EdgeInsets.fromLTRB(80, 0, 80, 0),
        child: PinCodeTextField(
          length: 4,
          obsecureText: false,
          animationType: AnimationType.fade,
          shape: PinCodeFieldShape.box,
          animationDuration: Duration(milliseconds: 300),
          borderRadius: BorderRadius.circular(5),
          inactiveColor: Colors.grey,
          textInputType: TextInputType.phone,
          fieldHeight: 40,
          fieldWidth: 30,
          onCompleted: (v) {
            // on complete
          },
          onChanged: (value) {
            setState(() {
              currentText = value;
            });
          },
        ));
  }

  @override
  Widget build(BuildContext context) {
    final bolc = Provider.of<MyCounter>(context);

    return Scaffold(
        appBar: new AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: new ListView(children: <Widget>[
              SizedBox(height: 20),
              Text(trans(context, 'pin_code'),
                  textAlign: TextAlign.center, style: env.mystyle2),
              const SizedBox(height: 15),
              Text(trans(context, 'pin_has_been_sent'),
                  textAlign: TextAlign.center, style: env.underHead),
              const SizedBox(height: 15),
              Text(monileNo,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 18,
                  )),
              const SizedBox(height: 15),
              pinCode(),
              new CircularPercentIndicator(
                radius: 130.0,
                progressColor: Colors.orange[300],
                circularStrokeCap: CircularStrokeCap.round,
                animation: true,
                animationDuration: 32000,
                lineWidth: 5.0,
                percent: 1,
                center: new CountDown(
                  style: env.mystyle2,
                  seconds: 30,
                  onTimer: () {
                    setState(() {
                      showTimer = false;
                    });
                  },
                ),
              ),
              const SizedBox(height: 15),
              Text(trans(context, 'code_not_recieved'),
                  textAlign: TextAlign.center, style: env.underHead),
              Padding(
                padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                child: FlatButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0),
                      side: BorderSide(color: Colors.black)),
                  color: Colors.white,
                  textColor: Colors.orange,
                  padding: EdgeInsets.all(8.0),
                  onPressed: () {},
                  child: Text(
                    trans(context, 'resend_code'),
                    style: env.resend,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(60, 30, 60, 10),
                  child: RaisedButton(
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                          side: BorderSide(color: Colors.orange)),
                      onPressed: () {
                        bolc.changechild(
                          trans(context, 'aprove'),
                        );
                        bolc.togelf();
                      },
                      color: Colors.deepOrangeAccent,
                      textColor: Colors.white,
                      child: bolc.returnchild(trans(context, 'aprove')))),
              Padding(
                  padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: Divider(color: Colors.black)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    trans(context, 'problem_in_regisration'),
                    style: env.mystyle,
                  ),
                  ButtonToUse(
                    trans(context, 'tech_support'),
                    fw: FontWeight.bold,
                    fc: Colors.green,
                  ),
                ],
              ),
            ])));
  }
}

class ButtonToUse extends StatelessWidget {
  ButtonToUse(this.buttonstring, {this.fw, this.fc, this.myfunc});
  final String buttonstring;
  final FontWeight fw;
  final Color fc;
  final Function myfunc;
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
        color: Colors.transparent,
        elevation: 0,
        child: Text(
          buttonstring,
          style: TextStyle(
            color: fc,
            fontSize: 15,
            fontFamily: "Almarai",
            fontWeight: fw,
          ),
        ),
        onPressed: () => myfunc());
  }
}