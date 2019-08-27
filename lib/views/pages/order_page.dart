import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/widget/order_listview.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {
    Widget _compilePage = Scaffold(
      body: Column(
        children: <Widget>[
          OrderListview(),
        ],
      ),
    );

    return _compilePage;
  }
}
