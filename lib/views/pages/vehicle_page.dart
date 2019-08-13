import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/widget/vehicle_listview.dart';

class VehiclePage extends StatefulWidget {
  @override
  _VehiclePageState createState() => _VehiclePageState();
}

class _VehiclePageState extends State<VehiclePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Column(
        children: <Widget>[
          VehicleListview(),
        ],
      ),
    );
  }
}
