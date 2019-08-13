import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_code_scanner/qr_scanner_overlay_shape.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

const flash_on = "FLASH ON";
const flash_off = "FLASH OFF";
const front_camera = "FRONT CAMERA";
const back_camera = "BACK CAMERA";

class ScanPage extends StatefulWidget {
  const ScanPage({
    Key key,
  }) : super(key: key);
  @override
  _ScanPageState createState() => _ScanPageState();
}

class _ScanPageState extends State<ScanPage> {
  Color _mainColor = Color(0xFFF48023);
  var qrText = "";
  var flashState = flash_on;
  var cameraState = front_camera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  IconData _iconFlash = Icons.flash_off;

  @override
  Widget build(BuildContext context) {
    Widget _slideWidget = new Column(
      children: <Widget>[
        Center(
          child: Icon(Icons.minimize),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0),
          child: Center(
            child: Text("More Option"),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 10.0, left: 15.0),
          child: Row(
            children: <Widget>[
              Card(
                margin: EdgeInsets.all(5.0),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.photo,
                        size: 50,
                      ),
                      Text("qr code"),
                    ],
                  ),
                ),
              ),
              Container(
                width: 15.0,
              ),
              Card(
                margin: EdgeInsets.all(5.0),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  child: Column(
                    children: <Widget>[
                      Icon(
                        Icons.keyboard,
                        size: 50,
                      ),
                      Text("unique code"),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );

    Widget _cameraWidget = new Column(
      children: <Widget>[
        Expanded(
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: _mainColor,
              borderRadius: 10.0,
              borderLength: 40.0,
              borderWidth: 5.0,
              cutOutSize: 300.0,
            ),
          ),
        ),
        Container(
          height: 150.0,
        )
      ],
    );

    Widget _compileWidget = new SlidingUpPanel(
      panel: _slideWidget,
      minHeight: 150.0,
      body: new Stack(
        children: <Widget>[
          _cameraWidget,
          Padding(
            padding: const EdgeInsets.all(23.0),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                child: Icon(
                  _iconFlash,
                  size: 30.0,
                ),
                backgroundColor: Colors.grey,
                onPressed: () {
                  if (controller != null) {
                    controller.toggleFlash();
                    if (_isFlashOn(flashState)) {
                      setState(() {
                        flashState = flash_off;
                        _iconFlash = Icons.flash_on;
                      });
                    } else {
                      setState(() {
                        flashState = flash_on;
                        _iconFlash = Icons.flash_off;
                      });
                    }
                  }
                },
              ),
            ),
          )
        ],
      ),
    );

    return _compileWidget;
  }

  _isFlashOn(String current) {
    return flash_on == current;
  }

  _isBackCamera(String current) {
    return back_camera == current;
  }

  void _onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        qrText = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
