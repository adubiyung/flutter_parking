import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/vehicle_model.dart';

class VehicleRow extends StatelessWidget {
  final VehicleModel _vehicle;
  VehicleRow(this._vehicle);

  @override
  Widget build(BuildContext context) {
    Widget listLayout = new Card(
      margin: EdgeInsets.only(bottom: 2.0),
      child: ListTile(
        leading: Container(
          height: 50.0,
          padding: EdgeInsets.only(right: 13.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.drive_eta,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(_vehicle.merkVehicle + " " + _vehicle.modelVehicle),
            Row(
              children: <Widget>[
                Text(_vehicle.numberVehicle + " - "),
                Text(_vehicle.yearVehicle),
              ],
            ),
          ],
        ),
        trailing: Padding(
          padding: EdgeInsets.only(right: 13.0),
          child: IconButton(
            icon: Icon(Icons.settings_applications),
            onPressed: () {
              print("object");
            },
          ),
        ),
      ),
    );

    return listLayout;
  }
}
