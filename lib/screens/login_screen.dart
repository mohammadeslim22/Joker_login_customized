import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '../functions.dart';
import '../screens/pincode.dart';
import '../widgets/buttonTouse.dart';
import 'package:provider/provider.dart';
import '../appLocalizations.dart';
import '../counter.dart';
import '../env.dart' as env;
import 'registrationscreen.dart';

class LoginScreen extends StatelessWidget {
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
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = false;
  FocusScopeNode _focusScopeNode = FocusScopeNode();
  Widget customtext(String text, TextEditingController cController, IconData i,
      TextInputType kt, TextInputAction action,
      {IconData y, bool obscureText, Function handleSubmission}) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: TextFormField(
        textInputAction: action,
        // TODO(isleem): handle submissions on username field

        // onFieldSubmitted: handleSubmission,
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
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
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
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Column(
        children: <Widget>[
          customtext(
            translate(context, 'mobile_no'),
            usernameController,
            Icons.person_outline,
            TextInputType.phone,
            TextInputAction.next,
            obscureText: false,
            handleSubmission: () {
              //   _focusScopeNode.nextFocus();
            },
          ),
          customtext(
            translate(context, 'password'),
            passwordController,
            Icons.lock_outline,
            TextInputType.visiblePassword,
            TextInputAction.go,
            y: (_obscureText == false)
                ? Icons.visibility
                : Icons.visibility_off,
            obscureText: _obscureText,
            // handleSubmission:
            //     lgoin(usernameController.text, passwordController.text),
          )
        ],
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
          padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
          child: new Image(
            image: new AssetImage('assets/images/logo.png'),
            width: 100.0,
            height: 100.0,
          ),
        ),
        Column(
          children: <Widget>[
            Text(AppLocalizations.of(context).translate('joker'),
                textAlign: TextAlign.center, style: env.mystyle2),
            SizedBox(height: 5),
            Text(translate(context, 'all_you_need'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.orange,
                  fontSize: 20,
                )),
          ],
        ),
        SizedBox(height: 50),
        Column(
          children: <Widget>[
            Text(translate(context, 'hello'), style: env.mystyle2),
            SizedBox(height: 10),
            Text(translate(context, 'enter_login_information'),
                style: env.mystyle),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            customcard(context),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
              ),
              child: Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                ButtonToUse(translate(context, 'forget_password'),
                    fw: FontWeight.w500, fc: Colors.black),
              ]),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 30, 20, 0),
              child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.orange)),
                  onPressed: () {
                    bolc.togelf();
                    Navigator.pushReplacement(
                      context,
                      new MaterialPageRoute(
                        builder: (BuildContext context) =>
                            new PinCode(monileNo: "0567505238"),
                      ),
                    );
                    bolc.changechild(
                      translate(context, 'login'),
                    );
                    bolc.togelf();
                  },
                  color: Colors.deepOrangeAccent,
                  textColor: Colors.white,
                  child: bolc.returnchild(translate(context, 'login'))),
            ),
            const SizedBox(height: 80),
            Text(
              translate(context, 'dont_have_account'),
              style: env.mystyle,
            ),
            ButtonToUse(
              translate(context, 'create_account'),
              fw: FontWeight.bold,
              fc: Colors.black,
              myfunc: () {
                Navigator.pushReplacement(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new PinCode(monileNo:"0567505238"),
                  ),
                );
              //  Navigator.pop(context);
              },
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 30, 00, 30),
              child: new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    translate(context, 'you_have_shop_'),
                    style: env.mystyle,
                  ),
                  
                  ButtonToUse(
                    translate(context, 'click_here'),
                    fw: FontWeight.bold,
                    fc: Colors.green,
                  ),
                ],
              ),
            )
          ],
        ),
      ]),
    ));
  }

  lgoin(String username, String password) {}
}


