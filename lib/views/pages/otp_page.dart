import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/pages/landing_page.dart';

final FocusNode _firstFocus = FocusNode();
final FocusNode _secondFocus = FocusNode();
final FocusNode _thirdFocus = FocusNode();
final FocusNode _fourthFocus = FocusNode();
final FocusNode _fifthFocus = FocusNode();

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  @override
  Widget build(BuildContext context) {
    Color _mainColor = Color(0xFFF48023);

    Widget _logoWidget = Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.only(
          top: 50.0,
          bottom: 15.0,
        ),
        child: Icon(
          Icons.chat,
          size: 33,
        ),
      ),
    );

    Widget _bodyWidget = Container(
      alignment: Alignment.center,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(
              'Masukan Kode',
              textAlign: TextAlign.center,
            ),
            Text(
              'Kami telah mengirimkan sebuah SMS dengan kode aktivasi ke handphone kamu',
              textAlign: TextAlign.center,
            ),
            Text(
              '+62 xxx xxxxxx',
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: 30,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    focusNode: _firstFocus,
                    onChanged: (String text) {
                      if (text.length == 1) {
                        _fieldFocusChange(context, _firstFocus, _secondFocus);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                ),
                SizedBox(
                  width: 30,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    focusNode: _secondFocus,
                    onChanged: (String text) {
                      if(text.length == 1) {
                        _fieldFocusChange(context, _secondFocus, _thirdFocus);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                ),
                SizedBox(
                  width: 30,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    focusNode: _thirdFocus,
                    onChanged: (String text) {
                      if (text.length == 1) {
                        _fieldFocusChange(context, _thirdFocus, _fourthFocus);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                ),
                SizedBox(
                  width: 30,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    focusNode: _fourthFocus,
                    onChanged: (String text) {
                      if(text.length == 1) {
                        _fieldFocusChange(context, _fourthFocus, _fifthFocus);
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 6.0, right: 6.0),
                ),
                SizedBox(
                  width: 30,
                  child: TextField(
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    focusNode: _fifthFocus,
                    onChanged: (String text) {
                      if (text.length == 1) {
                        _moveToLandingPage();
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );

    Widget _compileWidget = new Scaffold(
      appBar: AppBar(
        backgroundColor: _mainColor,
        title: Text('Verifikasi nomor'),
      ),
      backgroundColor: Colors.white,
      body: Material(
        child: Column(
          children: <Widget>[
            _logoWidget,
            _bodyWidget,
          ],
        ),
      ),
    );

    return _compileWidget;
  }

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  void _moveToLandingPage() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new LandingPage(),
    ));
  }
}