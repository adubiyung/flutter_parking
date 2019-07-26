import 'package:flutter/material.dart';

class ScanPage extends StatefulWidget {
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget _compileWidget = Scaffold(
      backgroundColor: _mainColor,
      body: Text('ini scan page', textAlign: TextAlign.center,),
    );
    return _compileWidget;
  }
}
