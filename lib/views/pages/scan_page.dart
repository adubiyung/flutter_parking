import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/pages/token_page.dart';
import 'package:flutter_parking_project/views/pages/vehicle_page.dart';
import 'package:flutter_parking_project/views/widget/color_library.dart';
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
  var qrText = "";
  var flashState = flash_on;
  var cameraState = front_camera;
  QRViewController controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  IconData _iconFlash = Icons.flash_off;

  @override
  Widget build(BuildContext context) {
    Widget _slideWidget = new Container(
      color: ColorLibrary.backgroundDark,
      child: new Column(
        children: <Widget>[
          //icon strip
          Center(
            child: Icon(Icons.minimize,),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0, top: 5.0),
            child: Align(
              alignment: Alignment.topLeft,
              child: new Text("another way", style: TextStyle(fontFamily: 'Work Sans', fontSize: 13, fontWeight: FontWeight.w300),),
            ),
          ),
          new Row(
            children: <Widget>[
              //option
              Padding(
                padding: EdgeInsets.only(top: 12.0, left: 15.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 10.0,
                    ),
                    //button option
                    new Row(
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ButtonTheme(
                              minWidth: 30.0,
                              height: 50.0,
                              child: FlatButton(
                                child: Icon(
                                  Icons.keyboard,
                                  size: 35,
                                  color: ColorLibrary.thinFontWhite,
                                ),
                                color: ColorLibrary.primary,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                onPressed: () {
                                  _moveToTokenPage();
                                },
                              ),
                            ),
                            Container(
                              height: 5.0,
                            ),
                            Text(
                              "Token",
                              style: TextStyle(fontFamily: 'Work Sans', fontSize: 13, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // line
              new Container(
                padding: EdgeInsets.only(left: 12.0, right: 12.0),
                height: 38.0,
                width: 30.0,
                decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(width: 2.0, color: Colors.black54)),
                ),
              ),
              //jarak
              new Container(
                width: 70.0,
              ),
              // vehicle option
              GestureDetector(
                onTap: () {
                  _moveToVehiclePage();
                },
                child: new Container(
                  width: 140.0,
                  height: 30.0,
                  padding: EdgeInsets.only(left: 15.0),
                  decoration: BoxDecoration(
                    border: Border(
                        left: BorderSide(width: 1.0, color: Colors.black54),
                        top: BorderSide(width: 1.0, color: Colors.black54),
                        right: BorderSide(width: 1.0, color: Colors.black54),
                        bottom: BorderSide(width: 1.0, color: Colors.black54)),
                  ),
                  child: new Row(
                    children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: Text("select vehicle"),
                      ),
                      Expanded(
                        flex: 1,
                        child: Container(
                          decoration: BoxDecoration(
                            border: Border(
                              left:
                                  BorderSide(width: 1.0, color: Colors.black54),
                            ),
                          ),
                          child: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );

    Widget _cameraWidget = new Column(
      children: <Widget>[
        Expanded(
          child: QRView(
            key: qrKey,
            onQRViewCreated: _onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: ColorLibrary.secondary,
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
              child: new SizedBox(
                width: 40.0,
                height: 40.0,
                child: FloatingActionButton(
                  child: Icon(
                    _iconFlash,
                    size: 20.0,
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

  void _moveToTokenPage() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new TokenPage(),
    ));
  }

  void _moveToVehiclePage() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new VehiclePage(),
    ));
  }
}
