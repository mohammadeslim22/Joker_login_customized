import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' as intl;
import 'package:location/location.dart';
import '../screens/login_screen.dart';
import '../widgets/TextFormInput.dart';
import '../widgets/buttonTouse.dart';
import 'package:provider/provider.dart';
import 'setlocation.dart';
import '../counter.dart';
import '../functions.dart';
import '../env.dart' as env;
import 'package:country_code_picker/country_code_picker.dart';
import 'package:geocoder/geocoder.dart';

class Registration extends StatelessWidget {
  final double lat;
  final double long;

  const Registration({Key key, this.lat, this.long}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RegistrationPage();
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<RegistrationPage>
    with TickerProviderStateMixin {
  List<String> location2;
  Location location = new Location();
  updateLocation() async {
    if (env.lat == null || env.long == null) {
      List<String> loglat = await getLocation();
      if (loglat.isEmpty) {
      } else {
        if (loglat[0] == null || loglat[1] == null) {
          List<String> loglat = await getLocation();
        } else {
          setState(() {
            this.location2 = loglat;
            env.lat = double.parse(location2.elementAt(0));
            env.long = double.parse(location2.elementAt(1));
          });
        }
      }
    }
  }

  Future getLocationName() async {
    try {
      env.coordinates = Coordinates(env.lat, env.long);
      env.addresses =
          await Geocoder.local.findAddressesFromCoordinates(env.coordinates);
      env.first = env.addresses.first;
      setState(() {
        env.first = env.addresses.first;
        env.locationController.text = (env.first == null)
            ? "loading"
            : env.first.addressLine == null ? "loading" : env.first.addressLine;
      });
    } catch (e) {
      // env.locationController.text = "";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  bool get isRTL => TextDirection.rtl == Directionality.of(context);

  bool _obscureText = false;

  static DateTime today = DateTime.now();

  DateTime firstDate = new DateTime(today.year - 90, today.month, today.day);
  DateTime lastDate = new DateTime(today.year - 18, today.month, today.day);

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: lastDate,
        firstDate: firstDate,
        lastDate: lastDate);
    if (picked != null && picked != today)
      setState(() {
        today = picked;
        env.birthDateController.text =
            intl.DateFormat('yyyy-MM-dd').format(picked);
        FocusScope.of(context).requestFocus(FocusNode());
      });
    if (picked == null || picked != today)
      FocusScope.of(context).requestFocus(FocusNode());
  }


  Widget customcard(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 30, 15, 0),
      child: Column(
        children: <Widget>[
          TextFormInput(
           text: translate(context, 'name'),
            cController:env.usernameController,
           prefixIcon: Icons.person_outline,
          kt:  TextInputType.visiblePassword,
            obscureText: false,
            readOnly: false,
          ),
          TextFormInput(
           text: translate(context, 'email'),
           cController: env.emailController,
            prefixIcon: Icons.mail_outline,
            kt: TextInputType.emailAddress,
            obscureText: false,
            readOnly: false,
          ),
          TextFormInput(
          text:  translate(context, 'mobile_no'),
           cController: env.mobileNoController,
          prefixIcon:  Icons.phone,
           kt: TextInputType.phone,
            obscureText: _obscureText,
            readOnly: false,
            suffixwidget: CountryCodePicker(
              onChanged: _onCountryChange,
              initialSelection: 'SA',
              favorite: <String>['+966', 'SA'],
              showFlagDialog: true,
              showFlag: false,
              showCountryOnly: false,
              showOnlyCountryWhenClosed: false,
              alignLeft: false,
              padding: (isRTL == true
                  ? const EdgeInsets.fromLTRB(0, 0, 30, 0)
                  : const EdgeInsets.fromLTRB(30, 0, 0, 0)),
            ),
          ),
          TextFormInput(
            text:  translate(context, 'password'),
          cController:   env.passwordController,
            prefixIcon: Icons.lock_outline,
            kt:TextInputType.visiblePassword,
            readOnly: false,
            suffixwidget: IconButton(
              icon: Icon(
                (_obscureText == false)
                    ? Icons.visibility
                    : Icons.visibility_off,
              ),
              onPressed: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            obscureText: _obscureText,
          ),
          TextFormInput(
           text:   translate(context, 'birth_date'),
          cController:  env.birthDateController,
            prefixIcon: Icons.date_range,
            kt: TextInputType.visiblePassword,
            obscureText: _obscureText,
            readOnly: false,
            suffixwidget: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Text("${today.toLocal()}".split(' ')[0]),
                SizedBox(
                  height: 20.0,
                ),
                IconButton(
                  color: Colors.orange,
                  icon: Icon(
                    Icons.calendar_today,
                  ),
                  onPressed: () {
                    _selectDate(context);
                  },
                ),
              ],
            ),
          ),
          TextFormInput(
             text:  translate(context, 'get_location'),
             cController:  env.locationController,
             prefixIcon: Icons.my_location,
            kt: TextInputType.visiblePassword,
            readOnly: true,
            onTab: () async {
              // await updateLocation();
              // location.onLocationChanged.listen((LocationData currentLocation) {
              //   getLocationName();
              // });
              // print("fucklkkkkkkkk");
            },
            suffixwidget: IconButton(
              icon: Icon(Icons.add_location),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                    builder: (BuildContext context) => new AutoLocate(
                        lat: env.lat ?? 51, long: env.long ?? 9.6),
                  ),
                );
              },
            ),
            obscureText: _obscureText,
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bolc = Provider.of<MyCounter>(context);
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: new ListView(
          children: <Widget>[
            SizedBox(height: 20),
            Text(translate(context, 'account_creation'),
                textAlign: TextAlign.center, style: env.mystyle2),
            SizedBox(height: 15),
            Text(
              translate(context, 'please_check'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.values.first,
                color: Color(0xFF303030),
                fontSize: 20,
              ),
            ),
            customcard(context),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: RaisedButton(
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(18.0),
                      side: BorderSide(color: Colors.orange)),
                  onPressed: () {
                    bolc.changechild(
                      translate(context, 'Regisration'),
                    );
                    bolc.togelf();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => new LoginScreen(),
                      ),
                    );
                    // Navigator.pop(context);
                    bolc.togelf();
                  },
                  color: Colors.deepOrangeAccent,
                  textColor: Colors.white,
                  child: bolc.returnchild(translate(context, 'Regisration'))),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
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
          ],
        ),
      ),
    );
  }

  void _onCountryChange(CountryCode countryCode) {
    FocusScope.of(context).requestFocus(FocusNode());
    print("New Country selected: " + countryCode.toString());
  }
}


