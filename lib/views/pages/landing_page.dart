import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/pages/account_page.dart';
import 'package:flutter_parking_project/views/pages/home_page.dart';
import 'package:flutter_parking_project/views/pages/order_page.dart';
import 'package:flutter_parking_project/views/pages/qrcode_page.dart';
import 'package:flutter_parking_project/views/pages/scan_page.dart';
import 'package:flutter_parking_project/views/widget/color_library.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _page = 0;
  GlobalKey _navigationKey = GlobalKey();

  final _pageOption = [
    HomePage(),
    ScanPage(),
    OrderPage(),
    AccountPage(),    
  ];

  @override
  Widget build(BuildContext context) {
    Widget _compileWidget = Scaffold(
      bottomNavigationBar: FancyBottomNavigation(
        tabs: [
          TabData(iconData: Icons.location_searching, title: "booking"),
          TabData(iconData: Icons.list, title: "OTS"),
          TabData(iconData: Icons.line_style, title: "orders"),
          TabData(iconData: Icons.person, title: "account"),
        ],
        textColor: ColorLibrary.regularFontWhite,
        barBackgroundColor: ColorLibrary.primary,
        circleColor: ColorLibrary.secondary,
        inactiveIconColor: ColorLibrary.secondary,
        onTabChangedListener: (position) {
          setState(() {
            _page = position;
          });
        },
      ),
      body: _pageOption[_page],
    );
    return _compileWidget;
  }
}
