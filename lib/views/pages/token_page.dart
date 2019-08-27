import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/pages/qrcode_page.dart';
import 'package:flutter_parking_project/views/widget/color_library.dart';
import 'package:virtual_keyboard/virtual_keyboard.dart';

class TokenPage extends StatefulWidget {
  @override
  _TokenPageState createState() => _TokenPageState();
  TokenPage({Key key, this.title}) : super(key: key);
  final String title;
}

class _TokenPageState extends State<TokenPage> {
  // Holds the text that user typed.
  String inputText = "";
  bool shiftEnabled = false;
  bool isNumericMode = true;

  var txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorLibrary.primary,
        elevation: 0.0,
        iconTheme: IconThemeData(color: ColorLibrary.thinFontWhite),
      ),
      body: Container(
        color: ColorLibrary.background,
        child: Column(
          children: <Widget>[
            Container(
              height: 25,
            ),
            Text(
              "Input Your PIN",
              style: TextStyle(
                  color: ColorLibrary.thinFontBlack,
                  fontFamily: 'Work Sans',
                  fontSize: 14),
            ),
            Container(
              height: 25,
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  width: 220,
                  child: TextField(
                    enabled: false,
                    obscureText: true,
                    keyboardType: TextInputType.phone,
                    textAlign: TextAlign.center,
                    controller: txt,
                    style: TextStyle(letterSpacing: 25),
                    onChanged: (String text) {
                      if (txt.text.length == 6) {
                        // _moveToCodePage();
                        print("ini " + txt.text);
                      }
                    },
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              color: ColorLibrary.backgroundDark,
              child: VirtualKeyboard(
                height: 300,
                textColor: ColorLibrary.thinFontBlack,
                type: VirtualKeyboardType.Numeric,
                onKeyPress: _onKeyPress,
              ),
            )
          ],
        ),
      ),
    );
  }

  _printLatestValue() {
    print("${txt.text}");
    if (txt.text.length == 6) {
      _moveToCodePage();     
    }
  }

  /// Fired when the virtual keyboard key is pressed.
  _onKeyPress(VirtualKeyboardKey key) {
    if (key.keyType == VirtualKeyboardKeyType.String) {
      txt.text = inputText + (shiftEnabled ? key.capsText : key.text);
      inputText = inputText + (shiftEnabled ? key.capsText : key.text);
    } else if (key.keyType == VirtualKeyboardKeyType.Action) {
      switch (key.action) {
        case VirtualKeyboardKeyAction.Backspace:
          if (inputText.length == 0) return;
          txt.text = inputText.substring(0, inputText.length - 1);
          inputText = inputText.substring(0, inputText.length - 1);
          break;
        case VirtualKeyboardKeyAction.Return:
          inputText = inputText + '\n';
          break;
        case VirtualKeyboardKeyAction.Space:
          inputText = inputText + key.text;
          break;
        case VirtualKeyboardKeyAction.Shift:
          shiftEnabled = !shiftEnabled;
          break;

        default:
      }
    }
    // Update the screen
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    txt.addListener(_printLatestValue);
  }

  void _moveToCodePage() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new QrcodePage(),
    ));
  }
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
