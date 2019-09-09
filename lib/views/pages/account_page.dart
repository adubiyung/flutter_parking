import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/widget/color_library.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    // Widget _topBackground = new Container(
    //   height: 300.0,
    //   decoration: BoxDecoration(
    //       borderRadius: BorderRadius.only(
    //         bottomLeft: Radius.circular(30),
    //         bottomRight: Radius.circular(30),
    //       ),
    //       color: ColorLibrary.secondaryAccent),
    // );

    Widget _compileWidget = new Scaffold(
      backgroundColor: Colors.grey,
      body: new SafeArea(
        child: new Stack(
          children: <Widget>[
            // _topBackground,
            // Container(
            //     margin: EdgeInsets.only(left: 90, bottom: 20),
            //     width: 299,
            //     height: 279,
            //     decoration: BoxDecoration(
            //         color: ColorLibrary.secondary,
            //         borderRadius: BorderRadius.only(
            //             topLeft: Radius.circular(160),
            //             bottomLeft: Radius.circular(290),
            //             bottomRight: Radius.circular(160),
            //             topRight: Radius.circular(10))),
            //   ),
            ClipPath(
              clipper: WaveClipper2(),
              child: Container(
                child: Column(),
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(color: ColorLibrary.secondary),
              ),
            ),
          ],
        ),
      ),
    );

    return _compileWidget;
  }
}

class WaveClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 29 - 50);
    var firstControlPoint = Offset(size.width * .25, size.height - 60 - 50);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class WaveClipper2 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 120);

    var firstEndPoint = Offset(size.width / 3, size.height - 60);
    var firstControlPoint = Offset(size.width * 0, size.height - 25);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width*0.7 , size.height - 20);
    var secondControlPoint = Offset(size.width * 0.7, size.height - 100);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
        

    var thirdEndPoint = Offset(size.width, size.height - 90);
    var thirdControlPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
