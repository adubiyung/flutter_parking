import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_parking_project/views/pages/otp_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  Color _mainColor = Color(0xFFF48023);
  Color _bgColor = Color(0xFF333333);

  @override
  Widget build(BuildContext context) {
    Widget _compile = new Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: _bgColor,
        elevation: 0.0,
      ),
      body: Material(
        color: _bgColor,
        child: Column(
          children: <Widget>[
            Text(
              "Enter your registered phone number to log in",
              style: TextStyle(color: Colors.white),
            ),
            TextFormField(
              key: new Key('phone'),
              decoration: new InputDecoration(labelText: 'Phone Number'),
              autocorrect: false,
            ),
            RaisedButton(
              color: Colors.orangeAccent,
              textColor: Colors.black,
              child: Text('CONTINUE'),
              onPressed: moveToOTP,
            )
          ],
        ),
      ),
    );
    return _compile;
  }

  void moveToOTP() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new OtpScreen(),
    ));
  }
}
