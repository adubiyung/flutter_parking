import 'package:barcode_flutter/barcode_flutter.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Qrcode_page extends StatefulWidget {
  @override
  _Qrcode_pageState createState() => _Qrcode_pageState();
}

class _Qrcode_pageState extends State<Qrcode_page> {
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {
    Widget _barcodeWidget = new Container(
      child: new BarCodeImage(
        data: "1234ABCD", // Code string. (required)
        codeType: BarCodeType.Code93, // Code type (required)
        lineWidth: 2.0, // width for a single black/white bar (default: 2.0)
        barHeight: 90.0, // height for the entire widget (default: 100.0)
        hasText: true, // Render with text label or not (default: false)
        onError: (error) {
          // Error handler
          print('error = $error');
        },
      ),
    );

    Widget _qrcodeLayer = new Container(
      alignment: Alignment.center,
      color: Colors.white,
      height: 500.0,
      width: 500.0,
      child: QrImage(
        data: 'asu bajingan',
        size: 250.0,
      ),
    );

    void _showDialog() {
      showGeneralDialog(
          barrierColor: Colors.black.withOpacity(0.5),
          transitionBuilder: (context, a1, a2, widget) {
            return Transform.scale(
              scale: a1.value,
              child: Opacity(
                opacity: a1.value,
                child: AlertDialog(
                  shape: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16.0)),
                  title: Text('Qr Code'),
                  content: _qrcodeLayer,
                ),
              ),
            );
          },
          transitionDuration: Duration(milliseconds: 200),
          barrierDismissible: true,
          barrierLabel: '',
          context: context,
          pageBuilder: (context, animation1, animation2) {});
    }

    Widget _qrcodeWidget = new GestureDetector(
      child: Card(
        child: new QrImage(
          data: 'asu bajingan',
          size: 250.0,
        ),
      ),
      onTap: () {
        _showDialog();
      },
    );

    Widget _compileWidget = new Scaffold(
      appBar: AppBar(
        title: Text('My QR'),
        backgroundColor: _mainColor,
      ),
      body: Column(
        children: <Widget>[
          _barcodeWidget,
          _qrcodeWidget,
        ],
      ),
    );

    return _compileWidget;
  }
}
