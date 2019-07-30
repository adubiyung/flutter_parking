import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/pages/account_page.dart';
import 'package:flutter_parking_project/views/pages/home_page.dart';
import 'package:flutter_parking_project/views/pages/order_page.dart';
import 'package:flutter_parking_project/views/pages/qrcode_page.dart';
import 'package:flutter_parking_project/views/pages/scan_page.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  Color _mainColor = Color(0xFFF48023);
  int _page = 0;
  GlobalKey _navigationKey = GlobalKey();

  final _pageOption = [
    HomePage(),
    OrderPage(),
    Qrcode_page(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    Widget _compileWidget = Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.white,
        backgroundColor: _mainColor,
        items: <Widget>[
          Icon(
            Icons.location_searching,
            size: 30,
          ),
          Icon(
            Icons.list,
            size: 30,
            semanticLabel: 'Orders',
          ),
          Icon(
            Icons.line_style,
            size: 30,
            semanticLabel: '',
          ),
          Icon(
            Icons.person,
            size: 30,
          ),
        ],
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
      ),
      body: _pageOption[_page],
    );
    return _compileWidget;
  }
}
