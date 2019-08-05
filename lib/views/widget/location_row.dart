import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/location_model.dart';
import 'package:flutter_parking_project/views/pages/location_search_page.dart';

class LocationRow extends StatelessWidget {
  final Location_model location_model;
  LocationRow(this.location_model);
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {
    final _locationCardIcon = new ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
      leading: Container(
        padding: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1.0, color: Colors.grey)),
        ),
        child: Icon(Icons.drive_eta),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15.0,
      ),
      // onTap: () {
      //   Navigator.push(context, MaterialPageRoute(builder: (context) => DetailTicketPage()));
      // },
    );

    final _locationLotIcon = new Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.drive_eta,
            size: 13.0,
          ),
          Text(
            " " + location_model.spaceLocation,
            style: TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );

    final _locationRangeIcon = new Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.near_me,
            size: 13.0,
          ),
          Text(
            " " + "0.6 km",
            style: TextStyle(fontSize: 10.0),
          ),
        ],
      ),
    );

    final _locationCardContent = new Container(
      margin: EdgeInsets.fromLTRB(90.0, 6.0, 60.0, 6.0),
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
            height: 4.0,
          ),
          Text(location_model.areaLocation),
          Container(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 13.0,
              ),
              Text(
                " " + location_model.rateLocation,
                style: TextStyle(fontSize: 13.0),
              ),
              Container(
                width: 15.0,
                child: Icon(
                  Icons.lens,
                  size: 3.0,
                ),
              ),
              Text(
                location_model.typeLocation,
                style: TextStyle(fontSize: 13.0),
              ),
            ],
          ),
          Container(
            height: 6.0,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _locationLotIcon,
              _locationRangeIcon,
            ],
          ),
        ],
      ),
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
