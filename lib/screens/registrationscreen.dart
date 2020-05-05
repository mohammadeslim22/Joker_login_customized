import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart' as intl;
import 'package:location/location.dart';
import '../widgets/TextFormInput.dart';
import '../widgets/buttonTouse.dart';
import 'package:provider/provider.dart';
import '../counter.dart';
import '../functions.dart';
import '../env.dart' as env;
import 'package:country_code_picker/country_code_picker.dart';
import 'package:geocoder/geocoder.dart';

class Registration extends StatelessWidget {
  const Registration({Key key, this.lat, this.long}) : super(key: key);
  final double lat;
  final double long;

  @override
  Widget build(BuildContext context) {
    return RegistrationPage();
  }
}

class RegistrationPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<RegistrationPage>
    with TickerProviderStateMixin {
  List<String> location2;
  Location location = Location();
  Future<bool> get updateLocation async {
    bool res;
    final List<String> loglat = await getLocation();
    if (loglat.isEmpty) {
      res = false;
    } else {
      if (loglat[0] == null || loglat[1] == null) {
        res = false;
      } else {
        setState(() {
          location2 = loglat;
          env.lat = double.parse(location2.elementAt(0));
          env.long = double.parse(location2.elementAt(1));
          res = true;
        });
      }
    }
    return res;
  }

  Future<void> getLocationName() async {
    try {
      env.coordinates = Coordinates(env.lat, env.long);
      env.addresses =
          await Geocoder.local.findAddressesFromCoordinates(env.coordinates);
      env.first = env.addresses.first;
      setState(() {
        env.first = env.addresses.first;
        env.locationController.text = (env.first == null)
            ? "loading"
            : env.first.addressLine?? "loading";
      });
    } catch (e){return;}
  }

  @override
  void initState() {
    super.initState();
  }

  bool get isRTL => TextDirection.rtl == Directionality.of(context);

  bool _obscureText = false;

  static DateTime today = DateTime.now();

  DateTime firstDate =  DateTime(today.year - 90, today.month, today.day);
  DateTime lastDate =  DateTime(today.year - 18, today.month, today.day);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<void> _selectDate(BuildContext context) async {
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
        child: Form(
            key: _formKey,
            onWillPop: () {
              return;
            },
            child: Column(children: <Widget>[
              TextFormInput(
                text: translate(context, 'name'),
                cController: env.usernameController,
                prefixIcon: Icons.person_outline,
                kt: TextInputType.visiblePassword,
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
                text: translate(context, 'mobile_no'),
                cController: env.mobileNoController,
                prefixIcon: Icons.phone,
                kt: TextInputType.phone,
                obscureText: _obscureText,
                readOnly: false,
                suffixwidget: CountryCodePicker(
                  onChanged: _onCountryChange,
                  initialSelection: 'SA',
                  favorite: const <String>['+966', 'SA'],
                  showFlagDialog: true,
                  showFlag: false,
                  showCountryOnly: false,
                  showOnlyCountryWhenClosed: false,
                  alignLeft: false,
                  padding: isRTL == true
                      ? const EdgeInsets.fromLTRB(0, 0, 30, 0)
                      : const EdgeInsets.fromLTRB(30, 0, 0, 0),
                ),
              ),
              TextFormInput(
                text: translate(context, 'password'),
                cController: env.passwordController,
                prefixIcon: Icons.lock_outline,
                kt: TextInputType.visiblePassword,
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
                text: translate(context, 'birth_date'),
                cController: env.birthDateController,
                prefixIcon: Icons.date_range,
                kt: TextInputType.visiblePassword,
                obscureText: _obscureText,
                readOnly: false,
                suffixwidget: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text("${today.toLocal()}".split(' ')[0]),
                   const SizedBox(
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
                text: translate(context, 'get_location'),
                cController: env.locationController,
                prefixIcon: Icons.my_location,
                kt: TextInputType.visiblePassword,
                readOnly: true,
                onTab: () async {
                  try {
                    if (await updateLocation) {
                      location.onLocationChanged
                          .listen((LocationData currentLocation) {
                        getLocationName();
                      });
                    } else {}
                  } catch (e) {return;}
                },
                suffixwidget: IconButton(
                  icon: Icon(Icons.add_location),
                  onPressed: () {},
                ),
                obscureText: _obscureText,
              ),
            ])));
  }

  @override
  Widget build(BuildContext context) {
    final MyCounter bolc = Provider.of<MyCounter>(context);
    return Scaffold(
      appBar: AppBar(),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child:  ListView(
          children: <Widget>[
            const SizedBox(height: 20),
            Text(translate(context, 'account_creation'),
                textAlign: TextAlign.center, style: env.mystyle2),
           const SizedBox(height: 15),
            Text(
              translate(context, 'please_check'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.values.first,
                color:const Color(0xFF303030),
                fontSize: 20,
              ),
            ),
            customcard(context),
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: RaisedButton(
                  shape:  RoundedRectangleBorder(
                      borderRadius:  BorderRadius.circular(18.0),
                      side: const BorderSide(color: Colors.orange)),
                  onPressed: () {
                    bolc.changechild(
                      translate(context, 'Regisration'),
                    );
                    bolc.togelf();
                    Navigator.pushNamed(
                      context,
                      '/Log',
                      arguments: null,
                    );
                    _formKey.currentState.validate();
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
