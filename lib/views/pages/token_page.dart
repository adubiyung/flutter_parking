import 'package:flutter/material.dart';
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

// True if shift enabled.
  bool shiftEnabled = false;

// is true will show the numeric keyboard.
  bool isNumericMode = true;

  var txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black54),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Container(height: 25,),
            Text(
              "Input Your PIN",
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
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(),
            ),
            Container(
              color: Colors.white,
              child: VirtualKeyboard(
                height: 300,
                textColor: Colors.black54,
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
    print("Second text field: ${txt.text}");
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
}

_fieldFocusChange(
    BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
  currentFocus.unfocus();
  FocusScope.of(context).requestFocus(nextFocus);
}
