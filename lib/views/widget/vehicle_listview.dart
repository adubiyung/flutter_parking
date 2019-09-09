import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/vehicle_model.dart';
import 'package:flutter_parking_project/views/widget/color_library.dart';
import 'package:flutter_parking_project/views/widget/vehicle_row.dart';

class VehicleListview extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        child: new CustomScrollView(
        scrollDirection: Axis.vertical,
        shrinkWrap: false,
        slivers: <Widget>[
          new SliverAppBar(
            title: Text("Your Vehicle", style: TextStyle(fontFamily: 'Work Sans'),),
            pinned: true,
            backgroundColor: ColorLibrary.primary,
          ),
          new SliverPadding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            sliver: new SliverList(
              delegate: new SliverChildBuilderDelegate(
                  (context, index) => new VehicleRow(vehicleList[index]),
                  childCount: vehicleList.length),
            ),
          )
        ],
      ),
      ),
    );
  }
}
