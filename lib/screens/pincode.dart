import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../functions.dart';
import '../pass_args.dart';
import '../widgets/buttonTouse.dart';
import 'package:provider/provider.dart';
import '../counter.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../env.dart' as env;
import 'package:timer_count_down/timer_count_down.dart';
import 'package:percent_indicator/percent_indicator.dart';

class PinCode extends StatelessWidget {


  const PinCode({Key key, this.monileNo}) : super(key: key);
    final String monileNo;
  @override
  Widget build(BuildContext context) {
    return LoginScreenPage(monileNo: monileNo);
  }
}

class LoginScreenPage extends StatefulWidget {

 const LoginScreenPage({this.monileNo});
  final String monileNo;
  @override
  _MyHomePageState createState() =>  _MyHomePageState(monileNo);
}

class _MyHomePageState extends State<LoginScreenPage>
    with TickerProviderStateMixin {

  _MyHomePageState(this.monileNo);
  AnimationController controller;
  final String monileNo;
  String currentText = "0000";
  bool showTimer = true;
  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration:const Duration(seconds: 30),
    );
   
  }

  Widget pinCode() {

    
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        margin: const EdgeInsets.fromLTRB(15, 30, 15, 30),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(7),
        ),
           padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Row(

          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 140,
              child: PinCodeTextField(
                length: 4,
                obsecureText: false,
                animationType: AnimationType.fade,
                shape: PinCodeFieldShape.box,
                animationDuration: const Duration(milliseconds: 300),
                borderRadius: BorderRadius.circular(5),
                inactiveColor: Colors.grey,
                textInputType: TextInputType.phone,
                fieldHeight: 40,
                fieldWidth: 30,
                onCompleted: ( String v) {
                  // on complete
                },
                onChanged: (String value) {
                  setState(() {
                    currentText = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final MyCounter bolc = Provider.of<MyCounter>(context);
final ScreenArguments args = ModalRoute.of(context).settings.arguments as ScreenArguments;
    return Scaffold(
        appBar:  AppBar(),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child:  ListView(children: <Widget>[
            const  SizedBox(height: 20),
              Text(translate(context, 'pin_code'),
                  textAlign: TextAlign.center, style: env.mystyle2),
              const SizedBox(height: 15),
              Text(translate(context, 'pin_has_been_sent'),
                  textAlign: TextAlign.center, style: env.underHead),
              const SizedBox(height: 15),
              Text(args.mobileNO,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                    fontSize: 18,
                  )),
              const SizedBox(height: 15),
              pinCode(),
               CircularPercentIndicator(
                radius: 130.0,
                progressColor: Colors.orange[300],
                circularStrokeCap: CircularStrokeCap.round,
                animation: true,
                animationDuration: 30900,
                lineWidth: 5.0,
                percent: 1,
                center:  CountDown(
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
              Text(translate(context, 'code_not_recieved'),
                  textAlign: TextAlign.center, style: env.underHead),
              Padding(
                padding: const EdgeInsets.fromLTRB(100, 20, 100, 20),
                child: FlatButton(
                  shape:  RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(20.0),
                      side:const BorderSide(color: Colors.black)),
                  color: Colors.white,
                  textColor: Colors.orange,
                  padding: const EdgeInsets.all(8.0),
                  onPressed: () {},
                  child: Text(
                    translate(context, 'resend_code'),
                    style: env.resend,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.fromLTRB(60, 30, 60, 10),
                  child: RaisedButton(
                      shape:  RoundedRectangleBorder(
                          borderRadius:  BorderRadius.circular(18.0),
                          side:const BorderSide(color: Colors.orange)),
                      onPressed: () {
                        bolc.changechild(
                          translate(context, 'aprove'),
                        );
                        bolc.togelf();
                            Navigator.pushNamed(
                      context,
                      '/Home',
                      
                    );
                      },
                      color: Colors.deepOrangeAccent,
                      textColor: Colors.white,
                      child: bolc.returnchild(translate(context, 'aprove')))),
             const Padding(
                  padding:  EdgeInsets.fromLTRB(30, 0, 30, 10),
                  child: Divider(color: Colors.black)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                      Flexible(
                  child: Text(
                    translate(context, 'problem_in_regisration'),
                    style: env.mystyle,
                  ),
                ),
                Flexible(
                  child: ButtonToUse(
                    translate(context, 'tech_support'),
                    fw: FontWeight.bold,
                    fc: Colors.green,
                  ),
                ),
                ],
              ),
            ])));
  }
}


