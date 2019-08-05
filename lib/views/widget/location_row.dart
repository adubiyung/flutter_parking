import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/location_model.dart';

class LocationRow extends StatelessWidget {
  final Location_model location_model;
  LocationRow(this.location_model);
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {
    final _locationCardIcon = new ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 22.0),
      leading: Container(
        padding: EdgeInsets.only(right: 2.0),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 2.0, color: Colors.grey)),
        ),
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
      // onTap: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailTicketPage()));
      // },
    );

    final _locationCardContent = new Container(
      margin: EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),
      constraints: BoxConstraints.expand(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 4.0,
          ),
          Text(
            location_model.nameLocation,
            style: TextStyle(fontSize: 15.0),
          ),
          Container(
            height: 5.0,
          ),
          Text(location_model.areaLocation)
        ],
      ),
    );

    final _locationCardIconRight = new ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 22.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
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
      // onTap: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailTicketPage()));
      // },
    );

    final _locationCard = new Container(
      child: _locationCardContent,
      height: 100.0,
      margin: EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.black12,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0)),
        ],
      ),
    );

    Widget _compileWidget = Container(
      height: 100.0,
      margin: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 10.0,
      ),
      child: new Stack(
        children: <Widget>[_locationCard, _locationCardIcon],
      ),
    );

    return _compileWidget;
  }
}
