import 'package:flutter/material.dart';

class LoginScreen2 extends StatefulWidget {
  @override
  _LoginScreenState2 createState() => _LoginScreenState2();
}

class _LoginScreenState2 extends State<LoginScreen2> {
  Color _mainColor = Color(0xFFF48023);
  Color _bgColor = Color(0xFF333333);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget _compile = new Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: _bgColor,
        elevation: 0.0,
      ),
    );
    return _compile;
  }
}
