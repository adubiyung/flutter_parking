import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_parking_project/screen/login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool checkVal = true;
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {
    //80% of screen width
    double _width = MediaQuery.of(context).size.width * 0.8;

    Widget _compile = new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/splash_img.png'),
                  fit: BoxFit.cover),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(20.0),
                    ),
                    Text(
                      'Parkirin',
                      style: TextStyle(color: _mainColor, fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    Text('Jangan Sampai Kamu Salah Parkir', style: TextStyle(color: _mainColor),)
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(15.00),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            child: Text('Login'),
                            textColor: Colors.white,
                            color: _mainColor,
                            onPressed: _moveToLogin,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: EdgeInsets.only(
                              top: 20.0,
                              bottom: 20.0,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.all(15.0),
                          ),
                          RaisedButton(
                            child: Text('Register'),
                            textColor: Colors.white,
                            color: _mainColor,
                            onPressed: _moveToLogin,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            padding: EdgeInsets.only(
                                top: 20.0,
                                bottom: 20.0,
                                left: 50.0,
                                right: 50.0),
                          ),
                        ],
                      ),
                    ),
                    RaisedButton(
                      child: Text('connect to facebook'),
                      textColor: Colors.white,
                      color: Color(0xFF0077CC),
                      onPressed: _moveToLogin,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.0),
                      ),
                      padding: EdgeInsets.only(
                          top: 20.0, bottom: 20.0, left: 50.0, right: 50.0),
                    ),
                    Row(
                      children: <Widget>[
                        Checkbox(
                            value: checkVal,
                            onChanged: (bool value) {
                              setState(() {
                                checkVal = value;
                              });
                            }),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            width: _width,
                            child: Column(
                              children: <Widget>[
                                Text.rich(
                                  TextSpan(
                                      text:
                                          'Dengan mendaftar, Anda telah menyetujui ',
                                      style: TextStyle(
                                        fontSize: 12,
                                      ),
                                      children: <TextSpan>[
                                        TextSpan(
                                          text: 'aturan penggunaan',
                                          style: TextStyle(
                                            color: Colors.redAccent,
                                            decoration:
                                                TextDecoration.underline,
                                            fontSize: 12,
                                          ),
                                        ),
                                        TextSpan(text: ' dan '),
                                        TextSpan(
                                            text: 'kebijakan privasi',
                                            style: TextStyle(
                                              color: Colors.redAccent,
                                              decoration:
                                                  TextDecoration.underline,
                                              fontSize: 12,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                _moveToLogin();
                                              }),
                                        TextSpan(
                                            text: ' Parkirin',
                                            style: TextStyle(
                                              fontSize: 12,
                                            )),
                                      ]),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
    return _compile;
  }

  void _moveToLogin() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new LoginScreen(),
    ));
  }
}
