import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'counter.dart';

class LoginOther extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginScreenPage();
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
  var bolc;

  @override
  @override
  void initState() {
    super.initState();
    bolc = Provider.of<MyCounter>(context);
  }

  Widget customtext(String text, TextEditingController cController, IconData i,
      TextInputType kt,
      {IconData y, bool obscureText}) {
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
    return Padding(
      padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Column(
        children: <Widget>[
          customtext(
            'رقم الجوال ',
            myController,
            Icons.person_outline,
            TextInputType.phone,
            obscureText: false,
          ),
          customtext(
            'كلمة المرور',
            myController2,
            Icons.lock_outline,
            TextInputType.visiblePassword,
            y: (_obscureText == false)
                ? Icons.visibility
                : Icons.visibility_off,
            obscureText: _obscureText,
          )
        ],
      ),
    );
  }

  String fontfamily = "Almarai";
  TextStyle mystyle = const TextStyle(
    fontWeight: FontWeight.w100,
    fontFamily: 'Almarai',
    color: Colors.black,
    fontSize: 15,
  );
  TextStyle mystyle2 = const TextStyle(
    fontFamily: "Almarai",
    fontWeight: FontWeight.bold,
    color: Colors.black,
    fontSize: 40,
  );
  Widget halfScreenDown() {
    return new ListView(children: <Widget>[
      Padding(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 0),
        child: new Image(
          image: new AssetImage('images/logo.png'),
          width: 100.0,
          height: 100.0,
        ),
      ),
      Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
            child: Text("خصومات", textAlign: TextAlign.center, style: mystyle2),
          ),
          Text("كل ما تحتاجه",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: fontfamily,
                fontWeight: FontWeight.w300,
                color: Colors.orange,
                fontSize: 20,
              )),
        ],
      ),
      Padding(
          padding: EdgeInsets.fromLTRB(0, 50, 0, 0),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Text("مرحبا  بك", style: mystyle2),
              ),
              Text("الرجاء ادخال رقم الموبايل وكلمة المرور", style: mystyle),
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
              ButtonToUse("نسيت كلمة المرور ؟",
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
            child: Text(
              "لا تمتلك حساب ؟",
              style: mystyle,
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
                  style: mystyle,
                ),
              ],
            ),
          )
        ],
      ),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).requestFocus(FocusNode());
            },
            child: halfScreenDown()));
  }
}

class ButtonToUse extends StatelessWidget {
  ButtonToUse(this.buttonstring, {this.fw, this.fc, this.myfunc});
  final String  buttonstring;
  final FontWeight fw;
 final  Color fc;
 final  Function myfunc;
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