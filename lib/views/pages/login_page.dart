import 'dart:convert';
import 'dart:io';

import 'package:country_pickers/country.dart';
import 'package:country_pickers/country_pickers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_parking_project/models/user_model.dart';
import 'package:flutter_parking_project/views/pages/otp_page.dart';
import 'package:flutter_parking_project/views/widget/color_library.dart';
import 'package:flutter_parking_project/views/widget/constant_utils.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  final Future<UserModel> userModel;
  const LoginPage({Key key, this.userModel}) : super(key: key);
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static final URL = ConstantUtils.URL_AUTH_PHONE;

  Future<UserModel> createPost(String url, {Map body}) async {
    return http.post(url, body: body).then((http.Response response) {
      final int statusCode = response.statusCode;

      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }
      return UserModel.fromJson(json.decode(response.body));
    });
  }

  Country _selectedCountry = CountryPickerUtils.getCountryByPhoneCode('62');
  TextEditingController numberControler = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    Widget _compile = new Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: ColorLibrary.primary,
        elevation: 0.0,
        iconTheme: IconThemeData(color: ColorLibrary.regularFontWhite),
      ),
      body: new Container(
        color: ColorLibrary.background,
        padding: EdgeInsets.only(left: 10.0, right: 10.0),
        child: new Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
              child: Text(
                "Enter your registered phone number to log in",
                style: TextStyle(
                    fontFamily: 'Work Sans', color: ColorLibrary.primaryDark),
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  flex: 2,
                  child: new Align(
                    alignment: Alignment.center,
                    child: new GestureDetector(
                      child: _showItem(_selectedCountry),
                      onTap: _openCountryPickerDialog,
                    ),
                  ),
                ),
                Container(
                  width: 10.0,
                ),
                Expanded(
                  flex: 5,
                  child: TextFormField(
                    key: new Key('phone'),
                    decoration: new InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    autocorrect: false,
                    controller: numberControler,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: ButtonTheme(
                    height: 45.0,
                    minWidth: double.infinity,
                    child: RaisedButton(
                      color: ColorLibrary.primary,
                      // shape: RoundedRectangleBorder(
                      //   side: BorderSide(color: ColorLibrary.primary),
                      //   borderRadius: BorderRadius.circular(20.0),
                      // ),
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(
                            fontFamily: 'Work Sans',
                            fontWeight: FontWeight.w700,
                            color: ColorLibrary.regularFontWhite),
                      ),
                      onPressed: () {
                        moveToOTP();
                      },
                    ),
                  )),
            ),
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

  Widget _showItem(Country country) => new Card(
      color: Colors.white54,
      child: new Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CountryPickerUtils.getDefaultFlagImage(country),
                SizedBox(width: 8.0),
                Text(
                  "+${country.phoneCode}",
                  style: TextStyle(fontSize: 14),
                ),
              ],
            ),
          )
        ],
      ));

  Widget _buildDialogItem(Country country) => Row(
        children: <Widget>[
          CountryPickerUtils.getDefaultFlagImage(country),
          SizedBox(width: 8.0),
          Text("+${country.phoneCode}"),
          SizedBox(width: 8.0),
          Flexible(child: Text(country.name))
        ],
      );

  mainTest() async {
    String url = 'http://10.0.2.2:8000/api/auth';
    Map map = {"user_phone": "081221631469"};

    print(await apiRequest(url, map));
  }

  Future<String> apiRequest(String url, Map jsonMap) async {
    HttpClient httpClient = new HttpClient();
    HttpClientRequest request = await httpClient.postUrl(Uri.parse(url));
    request.headers.set('content-type', 'application/json');
    request.add(utf8.encode(json.encode(jsonMap)));
    HttpClientResponse response = await request.close();
    // todo - you should check the response.statusCode
    String reply = await response.transform(utf8.decoder).join();
    httpClient.close();
    return reply;
  }
}
