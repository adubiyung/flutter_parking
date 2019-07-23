/**
 * 
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_parking_project/screen/welcome_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    new Timer(const Duration(seconds: 3), _moveToWelcome);
  }
  
  @override
  Widget build(BuildContext context) {
    Widget _background = new Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/splash_img.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );

    Widget _compile = new Scaffold(
      body: Stack(
        children: <Widget>[
          _background
        ],
      ),
    );

    return _compile;
  }

  void _moveToWelcome() {
    Navigator.of(context).pushReplacement(PageRouteBuilder(
      maintainState: true,
        opaque: true,
        pageBuilder: (context, _, __) => new WelcomeScreen(),
      transitionDuration: const Duration(seconds: 2),
      transitionsBuilder: (context, anim1, anim2, child) {
        return new FadeTransition(
            child: child,
            opacity: anim1,
        );
      }
    ));
  }

  // void _moveToInformation() {
  //   Navigator.of(context).pushReplacement(PageRouteBuilder(
  //     maintainState: true,
  //       opaque: true,
  //       pageBuilder: (context, _, __) => new LoginScreen(),
  //     transitionDuration: const Duration(seconds: 2),
  //     transitionsBuilder: (context, anim1, anim2, child) {
  //       return new FadeTransition(
  //           child: child,
  //           opacity: anim1,
  //       );
  //     }
  //   ));
  // }

  // void _moveToHome() {
  //   Navigator.of(context).pushReplacement(PageRouteBuilder(
  //     maintainState: true,
  //       opaque: true,
  //       pageBuilder: (context, _, __) => new LoginScreen(),
  //     transitionDuration: const Duration(seconds: 2),
  //     transitionsBuilder: (context, anim1, anim2, child) {
  //       return new FadeTransition(
  //           child: child,
  //           opacity: anim1,
  //       );
  //     }
  //   ));
  // }
}