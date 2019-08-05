import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/location_model.dart';

class LocationList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Material(
      child: new Column(
        children: <Widget>[
          new Padding(
            padding: new EdgeInsets.only(top: 20.0),
          ),
          new Expanded(
            child: new ListView.builder(
              itemCount: locationList.length,
              itemBuilder: (BuildContext context, int index) {
                return new Card(
                    child: new Text(locationList[index].toString()));
              },
            ),
          ),
        ],
      ),
    );
  }
}
