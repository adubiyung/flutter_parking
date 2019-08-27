import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/location_model.dart';
import 'package:flutter_parking_project/views/pages/location_detail_page.dart';
import 'package:flutter_parking_project/views/widget/color_library.dart';

class LocationRow extends StatelessWidget {
  final Location_model location_model;
  LocationRow(this.location_model);

  @override
  Widget build(BuildContext context) {
    final _locationLotIcon = new Container(
      child: Row(
        children: <Widget>[
          Icon(
            Icons.drive_eta,
            size: 13.0,
            color: ColorLibrary.thinFontWhite,
          ),
          Text(
            "  " + location_model.spaceLocation,
            style: TextStyle(
                fontSize: 10.0,
                color: ColorLibrary.thinFontWhite,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w300),
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
            color: ColorLibrary.thinFontWhite,
          ),
          Text(
            "  " + "0.6 km",
            style: TextStyle(
                fontSize: 10.0,
                color: ColorLibrary.thinFontWhite,
                fontFamily: 'Work Sans'),
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
            style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
                color: ColorLibrary.regularFontWhite),
          ),
          Container(
            height: 4.0,
          ),
          Text(
            location_model.areaLocation,
            style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w500,
                color: ColorLibrary.regularFontWhite),
          ),
          Container(
            height: 5.0,
          ),
          Row(
            children: <Widget>[
              Icon(
                Icons.star,
                size: 12.0,
                color: ColorLibrary.thinFontWhite,
              ),
              Text(
                " " + location_model.rateLocation,
                style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w300,
                color: ColorLibrary.thinFontWhite),
              ),
              Container(
                width: 15.0,
                child: Icon(
                  Icons.lens,
                  size: 3.0,
                  color: ColorLibrary.thinFontWhite,
                ),
              ),
              Text(
                location_model.typeLocation,
                style: TextStyle(
                fontSize: 12.0,
                fontFamily: 'Work Sans',
                fontWeight: FontWeight.w300,
                color: ColorLibrary.thinFontWhite),
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
        color: ColorLibrary.primary,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: <BoxShadow>[
          BoxShadow(
              color: Colors.transparent,
              blurRadius: 10.0,
              offset: Offset(0.0, 10.0)),
        ],
      ),
    );

    final _locationCardIcon = new ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 35.0),
      leading: Container(
        padding: EdgeInsets.only(right: 15.0),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1.0, color: Colors.grey)),
        ),
        child: Icon(Icons.drive_eta,
        color: ColorLibrary.thinFontWhite,),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 15.0,
        color: ColorLibrary.thinFontWhite,
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => LocationDetailPage()));
      },
    );

    Widget _compileWidget = Container(
      height: 100.0,
      margin: const EdgeInsets.symmetric(
        vertical: 6.0,
        horizontal: 10.0,
      ),
      child: new Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: <Widget>[
            _locationCard,
            _locationCardIcon,
          ],
        ),
      ),
    );

    return _compileWidget;
  }
}
