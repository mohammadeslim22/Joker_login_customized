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
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:vibration/vibration.dart';
import 'package:flutter/services.dart';

class Registration extends StatelessWidget {
  const Registration({Key key}) : super(key: key);
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
  static const SpinKitRing spinkit = SpinKitRing(
    color: Colors.orange,
    size: 30.0,
    lineWidth: 3,
  );
  SnackBar snackBar = SnackBar(
    content: const Text("Location Service was not aloowed  !"),
    action: SnackBarAction(
      label: 'Ok !',
      onPressed: () {},
    ),
  );
  Future<bool> get updateLocation async {
    bool res;
    setState(() {
      env.locationController.text = "getting your location...";
    });
    final List<String> loglat = await getLocation();
    if (loglat.isEmpty) {
      res = false;
    } else {
      setState(() {
        location2 = loglat;
        env.lat = double.parse(location2.elementAt(0));
        env.long = double.parse(location2.elementAt(1));
        res = true;
      });
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
            : env.first.addressLine ?? "loading";
      });
    } catch (e) {
      env.locationController.text =
          "Unkown latitude: ${env.lat.round().toString()} , longitud: ${env.long.round().toString()}";
    }
  }

  @override
  void initState() {
    super.initState();
  }

  bool _obscureText = false;

  static DateTime today = DateTime.now();

  DateTime firstDate = DateTime(today.year - 90, today.month, today.day);
  DateTime lastDate = DateTime(today.year - 18, today.month, today.day);
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

  Widget customcard(BuildContext context, MyCounter bolc) {
    final bool isRTL = Directionality.of(context) == TextDirection.rtl;
    final FocusNode focus = FocusNode();
    final FocusNode focus1 = FocusNode();
    final FocusNode focus2 = FocusNode();
    final FocusNode focus3 = FocusNode();
    final FocusNode focus4 = FocusNode();
    return Padding(
        padding: const EdgeInsets.fromLTRB(16, 32, 16, 0),
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
                  onFieldSubmitted: () {
                    focus.requestFocus();
                  }),
              TextFormInput(
                  text: translate(context, 'email'),
                  cController: env.emailController,
                  prefixIcon: Icons.mail_outline,
                  kt: TextInputType.emailAddress,
                  obscureText: false,
                  readOnly: false,
                  focusNode: focus,
                  onFieldSubmitted: () {
                    focus1.requestFocus();
                  }),
              TextFormInput(
                  text: translate(context, 'mobile_no'),
                  cController: env.mobileNoController,
                  prefixIcon: Icons.phone,
                  kt: TextInputType.phone,
                  obscureText: false,
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
                        ? const EdgeInsets.fromLTRB(0, 0, 32, 0)
                        : const EdgeInsets.fromLTRB(32, 0, 0, 0),
                  ),
                  focusNode: focus1,
                  onFieldSubmitted: () {
                    focus2.requestFocus();
                  }),
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
                focusNode: focus2,
              ),
              TextFormInput(
                text: translate(context, 'birth_date'),
                cController: env.birthDateController,
                prefixIcon: Icons.date_range,
                kt: TextInputType.visiblePassword,
                obscureText: false,
                readOnly: true,
                onTab: () {
                  _selectDate(context);
                },
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
                focusNode: focus3,
              ),
              TextFormInput(
                text: translate(context, 'get_location'),
                cController: env.locationController,
                prefixIcon: Icons.my_location,
                kt: TextInputType.visiblePassword,
                readOnly: true,
                onTab: () async {
                  try {
                    bolc.togelocationloading(true);

                    if (await updateLocation) {
                      await getLocationName();
                      bolc.togelocationloading(false);
                    } else {
                      Vibration.vibrate(duration: 400);
                      bolc.togelocationloading(false);

                      Scaffold.of(context).showSnackBar(snackBar);
                    //  Scaffold.of(context).hideCurrentSnackBar();
                      setState(() {
                        env.locationController.text = "Tap to set my location";
                      });
                    }
                  } catch (e) {
                    Vibration.vibrate(duration: 400);
                    bolc.togelocationloading(false);
                    Scaffold.of(context).showSnackBar(snackBar);
                    setState(() {
                      env.locationController.text = "Tap to set my location";
                    });
                  }
                },
                suffixwidget: IconButton(
                  icon: Icon(Icons.add_location),
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      '/AutoLocate',
                    );
                    Provider.of<MyCounter>(context).togelocationloading(false);
                  },
                ),
                obscureText: false,
                focusNode: focus4,
              ),
              Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 16,
                ),
                child: bolc.visibilityObs
                    ? Row(
                        children: const <Widget>[
                          Expanded(
                            child: spinkit,
                          ),
                        ],
                      )
                    : Container(),
              )
            ])));
  }

  @override
  Widget build(BuildContext context) {
    final MyCounter bolc = Provider.of<MyCounter>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Builder(
        builder: (BuildContext context) => GestureDetector(
          onTap: () {
            SystemChannels.textInput.invokeMethod<String>('TextInput.hide');
          },
          child: ListView(
            children: <Widget>[
              const SizedBox(height: 16),
              Text(translate(context, 'account_creation'),
                  textAlign: TextAlign.center, style: env.mystyle2),
              const SizedBox(height: 8),
              Text(
                translate(context, 'please_check'),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.values.first,
                  color: const Color(0xFF303030),
                  fontSize: 20,
                ),
              ),
              customcard(context, bolc),
              Padding(
                padding: const EdgeInsets.fromLTRB(32, 16, 32, 16),
                child: RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
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
              const Padding(
                  padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
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
      ),
    );
  }

  void _onCountryChange(CountryCode countryCode) {
    FocusScope.of(context).requestFocus(FocusNode());
  }
}
