import 'dart:async';
import 'dart:typed_data';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:geocoder/geocoder.dart';
import 'package:login_page_customized/env.dart' as env;
import 'package:login_page_customized/functions.dart';

class AutoLocate extends StatefulWidget {
  final double long;
  final double lat;

  const AutoLocate({Key key, this.long, this.lat}) : super(key: key);

  @override
  _AutoLocateState createState() => _AutoLocateState();
}

class _AutoLocateState extends State<AutoLocate> {
  GoogleMapController mapController;

  StreamSubscription getPositionSubscription;

  Location location = Location();
  double lat;
  double long;

  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _animateToUser();
  }

  Coordinates coordinates;
  List<Address> addresses;
  Address address;

  @override
  void initState() {
    super.initState();
    lat = widget.lat;
    long = widget.long;
    getLocationName(long, lat);
  }

  @override
  void dispose() {
    super.dispose();
    getPositionSubscription?.cancel();
  }

  Future getLocationName(double long, double lat) async {
    try {
      coordinates = Coordinates(lat, long);
      addresses =
          await Geocoder.local.findAddressesFromCoordinates(coordinates);
      setState(() =>address = addresses.first);
      print('fetched ${address.addressLine}');
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: _onMapCreated,
            padding: EdgeInsets.only(bottom: 60),
            mapType: MapType.normal,
            markers: Set<Marker>.of(markers.values),
            initialCameraPosition: CameraPosition(
              target: LatLng(lat, long),
              zoom: 5,
            ),
            onCameraMove: (pos) {
              setState(() {
                lat = pos.target.latitude;
                long = pos.target.longitude;
              });
            },
            onCameraIdle: () {
              setState(() {
                getLocationName(long, lat);
              });
            },
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: 170,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(1023, 249, 249, 249),
                    Color.fromARGB(0, 255, 255, 255)
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Column(
                children: <Widget>[
                  AppBar(
                    iconTheme: IconThemeData(color: Colors.black),
                    title: Text(
                      translate(context, 'set_ur_location'),
                      style: TextStyle(color: Colors.black),
                    ),
                    elevation: 0,
                    backgroundColor: env.trans,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Card(
                      elevation: 8,
                      margin: EdgeInsets.all(0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      child: ListTile(
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              address == null
                                  ? 'Loading'
                                  : address.addressLine??'',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 11),
                            ),
                            Text(
                              address == null
                                  ? 'Loading'
                                  : address.adminArea == null
                                      ? 'Unknown'
                                      : address.adminArea,
                              style: TextStyle(fontSize: 9),
                            ),
                          ],
                        ),
                        leading: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.search),
                        ),
                        trailing: IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.bookmark),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Icon(
                FontAwesomeIcons.mapMarkerAlt,
                color: env.blue,
                size: 32,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8.0, bottom: 69),
            child: Align(
              alignment: Alignment.bottomRight,
              child: Container(
                width: 40,
                height: 40,
                child: Material(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(6),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(6),
                    onTap: () {},
                    child: GestureDetector(
                      child: Center(
                        child: Icon(
                          Icons.my_location,
                          color: Color.fromARGB(1023, 150, 150, 150),
                        ),
                      ),
                      onTap: _animateToUser,
                    ),
                  ),
                ),
              ),
            ),
          ),
          accesptDeclineButtons(),
        ],
      ),
    );
  }

  void _addMarker(Marker marker) {
    final MarkerId markerId = MarkerId('current_location');

    setState(() {
      markers[markerId] = marker;
    });
  }

  Future _animateToUser() async {
    final Uint8List markerIcon =
        await getBytesFromAsset('assets/images/logo.png', 100);
    await location.getLocation().then((value) {
      mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(value.latitude, value.longitude),
        zoom: 13,
      )));
      getPositionSubscription = location.onLocationChanged.listen((value) {
        var marker = Marker(
          markerId: MarkerId('current_location'),
          position: LatLng(value.latitude, value.longitude),
          icon: BitmapDescriptor.fromBytes(markerIcon),
        );
        _addMarker(marker);
      });
      setState(() {
        lat = value.latitude;
        long = value.longitude;
      });
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    Codec codec = await instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  Widget accesptDeclineButtons() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 100,
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 50),
        child: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: Colors.orange)),
                onPressed: () => Navigator.pop(context),
                color: Colors.red,
                textColor: Colors.white,
                child: Text(translate(context, 'cancel'))),
            const SizedBox(
              width: 30,
            ),
            new RaisedButton(
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                    side: BorderSide(color: env.blue)),
                onPressed: () {
                  setState(() {
                    env.lat = lat;
                    env.long = long;
                    env.locationController.text = address == null
                        ? "unkown"
                        : address.addressLine == null
                            ? "unkown"
                            : address.addressLine;
                  });
                  Navigator.pop(context);

                },
                color: Colors.blue,
                textColor: Colors.white,
                child: Text(translate(context, 'pick'))),
          ],
        ),
      ),
    );
  }
}
