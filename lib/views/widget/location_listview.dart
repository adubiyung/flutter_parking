import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/location_model.dart';
import 'package:flutter_parking_project/views/widget/location_row.dart';

class LocationListview extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
        // color: _mainColor,
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => new LocationRow(locationList[index]),
                  childCount: locationList.length,
                ),
              ),
            ),
          ],
        ),
    );
  }
}
