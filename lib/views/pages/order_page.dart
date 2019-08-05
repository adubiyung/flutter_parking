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
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(70.0),
      //   child: AppBar(
      //     // elevation: 0.0,
      //     backgroundColor: _mainColor,
      //     title: Text(
      //       'Order List',
      //       style: TextStyle(fontSize: 12),
      //     ),
      //     actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.library_books, color: Colors.white70,)
      //     )
      //   ],
      //   leading: Container(),
      //   ),
      // ),
      body: Column(
        children: <Widget>[
          OrderListview(),
        ],
      ),
    );

    return _compilePage;
  }
}
