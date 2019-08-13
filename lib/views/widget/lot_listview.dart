import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/lot_model.dart';
import 'package:flutter_parking_project/views/widget/lot_row.dart';

class LotListview extends StatefulWidget {
  @override
  _LotListviewState createState() => _LotListviewState();
}

class _LotListviewState extends State<LotListview> {
  @override
  Widget build(BuildContext context) {

    return new Scaffold(
      body: new Container(
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            SliverAppBar(
              title: Text("data"),
              pinned: true,
            ),
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              sliver: new SliverList(
                delegate: new SliverChildBuilderDelegate(
                  (context, index) => LotRow(LotList[index]),
                  childCount: LotList.length
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
