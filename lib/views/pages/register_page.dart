import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/pages/login_page.dart';
import 'package:flutter_parking_project/views/pages/otp_page.dart';

var _nameCon = TextEditingController();
var _emailCon = TextEditingController();
var _phoneCon = TextEditingController();
final FocusNode _nameFocus = FocusNode();
final FocusNode _emailFocus = FocusNode();
final FocusNode _phoneFocus = FocusNode();

class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {
    Widget _logoWidget = Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(top: 35.0, bottom: 35.0),
        child: Icon(Icons.local_parking),
      ),
    );

    Widget _registerCardWidget = Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10.0,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  'Daftar Baru',
                  style: TextStyle(fontSize: 18.0, color: Colors.black),
                ),
              ),
              Column(
                children: <Widget>[
                  TextFormField(
                    controller: _nameCon,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                    validator: _validateName,
                    focusNode: _nameFocus,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _nameFocus, _emailFocus);
                    },
                    decoration: InputDecoration(
                      labelText: 'Nama Lengkap',
                      icon: Icon(
                        Icons.perm_identity,
                        color: _nameFocus.hasFocus ? _mainColor : Colors.grey,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _mainColor),
                      ),
                      labelStyle: TextStyle(
                          color:
                              _nameFocus.hasFocus ? _mainColor : Colors.grey),
                    ),
                  ),
                  TextFormField(
                    controller: _emailCon,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                    focusNode: _emailFocus,
                    onFieldSubmitted: (term) {
                      _fieldFocusChange(context, _emailFocus, _phoneFocus);
                    },
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                          color:
                              _emailFocus.hasFocus ? _mainColor : Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _mainColor),
                      ),
                      icon: Icon(
                        Icons.email,
                        color: _emailFocus.hasFocus ? _mainColor : Colors.grey,
                      ),
                    ),
                  ),
                  TextFormField(
                    controller: _phoneCon,
                    decoration: InputDecoration(
                      labelText: 'No. HP',
                      icon: Icon(
                        Icons.phone_android,
                        color: _phoneFocus.hasFocus ? _mainColor : Colors.grey,
                      ),
                      labelStyle: TextStyle(
                          color:
                              _phoneFocus.hasFocus ? _mainColor : Colors.grey),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: _mainColor),
                      ),
                    ),
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.phone,
                    validator: _validatePhone,
                    focusNode: _phoneFocus,
                    onFieldSubmitted: (term) {},
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(top: 28.0),
                child: Column(
                  children: <Widget>[
                    ButtonTheme(
                      minWidth: double.infinity,
                      child: RaisedButton(
                        child: Text('Daftar !'),
                        color: _mainColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        onPressed: _moveToOTP,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('sudah punya akun? '),
                    InkWell(
                      splashColor: _mainColor,
                      onTap: () {
                        _moveToLogin();
                      },
                      child: Text(
                        'Masuk',
                        style: TextStyle(
                            color: _mainColor, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

    Widget _compileWidget = Scaffold(
      backgroundColor: Colors.grey,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 35.0),
          child: Column(
            children: <Widget>[
              _logoWidget,
              _registerCardWidget,
            ],
          ),
        ),
      ),
    );

    return _compileWidget;
  }

  String _validateName(String value) {
    return value.trim().isEmpty ? "Nama tidak boleh kosong" : null;
  }

  String _validateEmail(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value)) {
      return 'Email tidak sesuai';
    } else {
      return null;
    }
  }

  String _validatePhone(String value) {
    return value.length < 10 ? 'Nomor tidak sesuai' : null;
  }

  void _moveToOTP() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new OtpPage(),
    ));
  }

  void _moveToLogin() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new LoginPage(),
    ));
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
