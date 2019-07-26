import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget _compileWidget = Scaffold(
      backgroundColor: _mainColor,
      body: Text('ini home', textAlign: TextAlign.center,),
    );
    return _compileWidget;
  }
}
