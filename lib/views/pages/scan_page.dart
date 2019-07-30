//import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Color _mainColor = Color(0xFFF48023);
  String result = "Hey there !";

  @override
  Widget build(BuildContext context) {
    Widget _cameraWidget = Container();

    Widget _bottomWidget = Container(
      alignment: Alignment.center,
      color: Colors.grey,
      
    );

    Widget _compileWidget = Scaffold(
      backgroundColor: _mainColor,
      body: Column(
        children: <Widget>[
          _bottomWidget,
        ],
      ),
    );
    return _compileWidget;
  }
}
