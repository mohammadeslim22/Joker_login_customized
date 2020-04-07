import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyCounter(),
      child: LoginScreenPage(),
      builder: (context) => MyCounter(),
    );
  }
}

class LoginScreenPage extends StatefulWidget {
  LoginScreenPage({Key key}) : super(key: key);
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<LoginScreenPage>
    with TickerProviderStateMixin {
  final myController = TextEditingController();
  final myController2 = TextEditingController();
  bool _obscureText = false;
  Widget customtext(String text, TextEditingController cController, IconData i,
      TextInputType kt,
      {IconData y, bool isRTL, bool obscureText}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: TextFormField(
        keyboardType: kt,
        controller: cController,
        style: new TextStyle(
          color: Colors.black,
          fontSize: 15,
        ),
        obscureText: obscureText,
        decoration: InputDecoration(
          enabledBorder: new OutlineInputBorder(
              borderSide: new BorderSide(
            color: Colors.grey,
          )),
          filled: true,
          fillColor: const Color(0xFFE9E9E9),
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 15,
            fontFamily: 'Almarai',
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(70),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 0),
          prefixIcon: Icon(i),
          suffixIcon: IconButton(
            icon: Icon(y),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget customcard(BuildContext context) {
    bool isRTL =
        (Directionality.of(context) == TextDirection.rtl) ? true : false;
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Material(
        elevation: 0.0001,
        borderRadius: BorderRadius.circular(25.0),
        borderOnForeground: true,
        child: Column(
          children: <Widget>[
            Material(
              borderOnForeground: true,
              borderRadius: BorderRadius.circular(25.0),
              child: Column(
                children: <Widget>[
                  customtext(
                    'رقم الجوال ',
                    myController,
                    Icons.person_outline,
                    TextInputType.phone,
                    isRTL: isRTL,
                    obscureText: false,
                  ),
                  customtext('كلمة المرور', myController2, Icons.lock_outline,
                      TextInputType.visiblePassword,
                      y: (_obscureText == false)
                          ? Icons.visibility
                          : Icons.visibility_off,
                      obscureText: _obscureText,
                      isRTL: isRTL)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bolc = Provider.of<MyCounter>(context);
    return Scaffold(
        body: GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: new ListView(children: <Widget>[
        Padding(
            padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
            child: new Image(
              image: new AssetImage('images/logo.png'),
              width: 100.0,
              height: 100.0,
            )),
        Center(
            child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
              child: Text("خصومات",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 40,
                  )),
            ),
            Text("كل ما تحتاجه",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w300,
                  color: Colors.orange,
                  fontSize: 20,
                )),
          ],
        )),
        Padding(
            padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text("مرحبا  بك",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Almarai',
                        color: Colors.black,
                        fontSize: 35,
                      )),
                ),
                Text("الرجاء ادخال رقم الموبايل وكلمة المرور",
                    style: TextStyle(
                      fontWeight: FontWeight.w100,
                      fontFamily: 'Almarai',
                      color: Colors.black,
                      fontSize: 15,
                    )),
              ],
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            customcard(context),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 5.0,
              ),
              child: Row(children: [
                ButtonToUse(" نسيت كلمة المرور ؟",
                    fw: FontWeight.w500, fc: Colors.black),
              ]),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.orange)),
                  onPressed: () {
                    bolc.changechild();
                    bolc.togelf();
                  },
                  color: Colors.deepOrangeAccent,
                  textColor: Colors.white,
                  child: bolc.f),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 80, 00, 10),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "لا تمتلك حساب ؟",
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: "Almarai",
                    fontWeight: FontWeight.w100,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 00, 30),
              child: ButtonToUse("إنشاء حساب",
                  fw: FontWeight.bold, fc: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 00, 30),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ButtonToUse(
                    " اضغط هنا",
                    fw: FontWeight.bold,
                    fc: Colors.green,
                  ),
                  Text(
                    "تمتلك متجر وترغب بالانضمام",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontFamily: "Almarai",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    ));
  }
}

class ButtonToUse extends StatelessWidget {
  ButtonToUse(this.buttonstring, {this.fw, this.fc, this.myfunc});
  var buttonstring;
  FontWeight fw;
  Color fc;
  Function myfunc;
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
      onPressed: () {
        myfunc();
      },
    );
  }
}
