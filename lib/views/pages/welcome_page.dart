import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/pages/home_page.dart';
import 'package:flutter_parking_project/views/pages/login_page.dart';
import 'package:flutter_parking_project/views/pages/order_page.dart';
import 'package:flutter_parking_project/views/pages/register_page.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  Color _mainColor = Color(0xFFF48023);
  Color _bgColor = Color(0xFF333333);
  Color _whiteColor = Color(0xFFFFFFFF);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    Widget _compile = new Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            color: _mainColor,
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
                      'Parkiran',
                      style: TextStyle(
                          color: _whiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Jangan Sampai Kamu Salah Parkir',
                      style: TextStyle(color: _whiteColor),
                    ),
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
                      child: Column(
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 250.0,
                            child: RaisedButton(
                              child: Text('MASUK'),
                              textColor: _whiteColor,
                              color: _mainColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: _whiteColor),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              onPressed: _moveToLogin,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 30.0, right: 20.0),
                                child: Divider(
                                  color: Colors.white
                                ),
                              ),
                            ),
                            Text(
                              'ATAU',
                              style: TextStyle(color: Colors.black45),
                            ),
                            Expanded(
                              child: Container(
                                margin: const EdgeInsets.only(
                                    left: 20.0, right: 30.0),
                                child: Divider(
                                  color: _whiteColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.all(15.00),
                      child: Column(
                        children: <Widget>[
                          ButtonTheme(
                            minWidth: 250.0,
                            child: RaisedButton(
                              child: Text('DAFTAR'),
                              textColor: _mainColor,
                              color: _whiteColor,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(color: _whiteColor),
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                              onPressed: _moveToRegister,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
    return _compile;
  }

  void _moveToLogin() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new LoginPage(),
    ));
  }

  void _moveToRegister() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new RegisterPage(),
    ));
  }
}
