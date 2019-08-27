import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/location_model.dart';
import 'package:flutter_parking_project/views/pages/location_search_page.dart';
import 'package:flutter_parking_project/views/widget/color_library.dart';
import 'package:flutter_parking_project/views/widget/location_row.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GoogleMapController _mapController;
  Geolocator _geolocator;
  LatLng _currentPosition;
  double _currentZoom;
  StreamSubscription<Position> _positionStream;
  Map<MarkerId, Marker> markers = <MarkerId, Marker>{};
  bool _shouldRecenterMap = true;
  Timer _mapDragTimer;

  @override
  void initState() {
    super.initState();

    _currentPosition = LatLng(-6.175048, 106.827127);
    _currentZoom = 17.5;

    _initLocationService();
  }

  Future<void> _initLocationService() async {
    _geolocator = Geolocator();
    var locationOptions = LocationOptions(accuracy: LocationAccuracy.best);

    try {
      _positionStream =
          _geolocator.getPositionStream(locationOptions).listen((position) {
        if (position != null) {
          _updateCurrentPosition(position);
        }
      });
    } on Exception catch (_) {
      print("Permission denied");
    }
  }

  @override
  void dispose() {
    _positionStream.cancel();
    super.dispose();
  }

  void _updateCurrentPosition(Position position) {
    _currentPosition = LatLng(position.latitude, position.longitude);

    _moveMarker(position);
    _refreshCameraPosition();
    _geocodeCurrentPosition();
  }

  void _moveMarker(Position position) {
    var markerId = MarkerId("currentPos");
    setState(() {
      markers[markerId] =
          Marker(markerId: markerId, position: _currentPosition);
    });
  }

  void _refreshCameraPosition() {
    if (_mapController != null && _shouldRecenterMap) {
      _mapController.animateCamera(CameraUpdate.newCameraPosition(
        CameraPosition(target: _currentPosition, zoom: _currentZoom),
      ));
    }
  }

  void _geocodeCurrentPosition() async {
    var resultList = await _geolocator.placemarkFromCoordinates(
        _currentPosition.latitude, _currentPosition.longitude,
        localeIdentifier: "id-ID");

    if (resultList.length > 0) {
      Placemark firstResult = resultList[0];

      String textResult = firstResult.thoroughfare +
          " " +
          firstResult.subThoroughfare +
          ", " +
          firstResult.locality;

      setState(() {
        print("ini adalah region = " + textResult);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget _topWidget = new Container(
      margin: EdgeInsets.only(top: 15.0),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topCenter,
            child: Icon(
              Icons.maximize,
            ),
          ),
          //ButtonSearch(),
        ],
      ),
    );

    Widget _middleWidget = new Container(
      child: Column(
        children: <Widget>[
          GestureDetector(
            child: LocationRow(locationList[0]),
            onTap: _moveToSearch,
          ),
          GestureDetector(
            child: LocationRow(locationList[1]),
            onTap: _moveToSearch,
          ),
          Container(
            height: 5.0,
          ),
          Center(
              child: GestureDetector(
            child: Text(
              "show more",
              style: TextStyle(color: ColorLibrary.thinFontWhite),
            ),
            onTap: _moveToSearch,
          ))
        ],
      ),
    );

    Widget _slideWidget = new Container(
      color: ColorLibrary.backgroundDark,
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
            mapType: MapType.normal,
            myLocationEnabled: true,

            initialCameraPosition:
                CameraPosition(target: _currentPosition, zoom: _currentZoom),
            onMapCreated: (controller) {
              _mapController = controller;
            },
            onCameraMove: (cameraPosition) {
              _currentZoom = cameraPosition.zoom;
              _shouldRecenterMap = false; 
              if (_mapDragTimer != null && _mapDragTimer.isActive) {
                _mapDragTimer.cancel();
              }
              _mapDragTimer = Timer(Duration(seconds: 3), () {
                _shouldRecenterMap = true;
              });
            },
            markers: Set<Marker>.of(markers.values),
          ),
        ],
      ),
    );

    return _compileWidget;
  }

  void _moveToSearch() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => LocationSearchPage(),
        ));
  }
}
