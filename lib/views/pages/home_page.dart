import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/location_model.dart';
import 'package:flutter_parking_project/models/ticket.dart';
import 'package:flutter_parking_project/views/widget/button_search.dart';
import 'package:flutter_parking_project/views/widget/location_list.dart';
import 'package:flutter_parking_project/views/widget/location_row.dart';
import 'package:flutter_parking_project/views/widget/order_list.dart';
import 'package:flutter_parking_project/views/widget/search_destination.dart';
import 'package:flutter_parking_project/views/widget/ticket_row.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _mainColor = Color(0xFFF48023);

  GoogleMapController _mapController;
  Completer<GoogleMapController> _controller = Completer();
  PanelController _pc = new PanelController();

  // Map<String, double> currentLocation = new Map();
  // StreamSubscription<Map<String, double>> _streamSubscription;

  // Location _location = new Location();

  // @override
  // void initState() {
  //   super.initState();
  //   currentLocation['latitude'] = 0.0;
  //   currentLocation['longitude'] = 0.0;

  //   initPlatformState();
  //   _streamSubscription = _location.onLocationChanged.listen((Map<String, double> result) {
  //     setState(() {
  //       currentLocation = result;
  //     });
  //   });
  // }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(6.222222, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget _topWidget = new Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Row(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.keyboard_arrow_up,
            ),
          ),
          ButtonSearch(),
        ],
      ),
    );

    Widget _middleWidget = new Container(
      child: Column(
        children: <Widget>[
          LocationRow(locationList[0]),
          LocationRow(locationList[1]),
          Container(height: 5.0,),
          Center(
            child: Text("show more", style: TextStyle(color: Colors.blueGrey),),
          )
        ],
      ),
    );

    Widget _slideWidget = new Container(
      child: Column(
        children: <Widget>[_topWidget, _middleWidget],
      ),
    );

    Widget _compileWidget = new SlidingUpPanel(
      panel: _slideWidget,
      minHeight: 150.0,
      maxHeight: MediaQuery.of(context).size.height / 2,
      body: Stack(
        children: <Widget>[
          GoogleMap(
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
            initialCameraPosition: _kGooglePlex,
            mapType: MapType.normal,
            myLocationEnabled: true,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                onPressed: () => print('button pressed'),
                materialTapTargetSize: MaterialTapTargetSize.padded,
                backgroundColor: Colors.green,
                child: const Icon(Icons.map, size: 36.0),
              ),
            ),
          ),
        ],
      ),
    );

    return _compileWidget;
  }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  void initPlatformState() {}
}
