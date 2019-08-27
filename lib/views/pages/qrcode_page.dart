import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/widget/color_library.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrcodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _barcode = new Container(
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: new BarCodeImage(
          data: "9943589872",
          codeType: BarCodeType.Code128,
          lineWidth: 2.0,
          barHeight: 80.0,
          onError: (error) {
            print("barcode error $error");
          },
        ),
      )),
    );

    Widget _qrcode = new Container(
      width: 230.0,
      height: 230.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: QrImage(
          data: "9943589872",
          version: 1,
        ),
      ),
    );

    Widget _compile = new Container(
      margin: EdgeInsets.all(10.0),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          new Text(
            "The following code is your token number to make payment at warden.",
            style: TextStyle(fontFamily: 'Work Sans', fontSize: 11),
            textAlign: TextAlign.center,
          ),
          _barcode,
          _qrcode,
          Container(height: 8.0,),
          new Text(
            "9943589872",
            style: TextStyle(fontFamily: 'Work Sans', fontSize: 27),
          ),
          Container(height: 5.0,),
          new Text(
            "Berlaku selama ",
            style: TextStyle(
                fontFamily: 'Work Sans', fontSize: 10, color: Colors.grey),
          )
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorLibrary.primary,
        iconTheme: IconThemeData(color: ColorLibrary.regularFontWhite),
        title: Text(
          "Token",
          style: TextStyle(
              fontFamily: 'Work Sans', color: ColorLibrary.regularFontWhite),
        ),
      ),
      body: _compile,
    );
  }
}
