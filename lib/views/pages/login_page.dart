import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_parking_project/views/pages/otp_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Color _mainColor = Color(0xFFF48023);
  Color _bgColor = Color(0xFF333333);
  Country _selectedCountry = CountryPickerUtils.getCountryByPhoneCode('62');

  @override
  Widget build(BuildContext context) {
    Widget _compile = new Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        backgroundColor: _mainColor,
        elevation: 0.0,
      ),
      body: Material(
        color: Colors.white,
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        ListTile(
                          onTap: _openCountryPickerDialog,
                          title: _showItem(_selectedCountry),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Enter your registered phone number to log in",
                        style: TextStyle(color: Colors.white),
                      ),
                      TextFormField(
                        key: new Key('phone'),
                        decoration:
                            new InputDecoration(labelText: 'Phone Number'),
                        autocorrect: false,
                      ),
                    ],
                  ),
                ),
              ],
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
      pageBuilder: (context, _, __) => new OtpPage(),
    ));
  }

  void _openCountryPickerDialog() => showDialog(
        context: context,
        builder: (context) => Theme(
            data: Theme.of(context).copyWith(primaryColor: Colors.pink),
            child: CountryPickerDialog(
                titlePadding: EdgeInsets.all(2.0),
                searchCursorColor: Colors.pinkAccent,
                searchInputDecoration:
                    InputDecoration(hintText: 'Type in Country name or code'),
                isSearchable: true,
                title: Text('search country code'),
                onValuePicked: (Country country) =>
                    setState(() => _selectedCountry = country),
                itemBuilder: _buildDialogItem)),
      );

  Widget _showItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text(
            "+${country.phoneCode}",
            style: TextStyle(fontSize: 14),
          )
        ],
      );

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      );
}
