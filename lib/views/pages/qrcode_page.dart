import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QrcodePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _barcode = new Container(
      child: Center(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: new BarCodeImage(
          data: "ini isi barcode",
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
      child: QrImage(
        data: "ini isi qrcode",
      ),
    );

    Widget _compile = new Container(
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          _barcode,
          _qrcode,
          Text("ini isi data"),
        ],
      ),
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: _compile,
    );
  }
}
