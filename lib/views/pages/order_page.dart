import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/ticket.dart';
import 'package:flutter_parking_project/views/pages/history_order_page.dart';
import 'package:flutter_parking_project/views/widget/color_library.dart';
import 'package:flutter_parking_project/views/widget/ticket_row.dart';

class OrderPage extends StatefulWidget {
  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    Widget _body = new Column(
      children: <Widget>[
        new Expanded(
          child: new Container(
            color: ColorLibrary.backgroundDark,
            child: new CustomScrollView(
              scrollDirection: Axis.vertical,
              shrinkWrap: false,
              slivers: <Widget>[
                new SliverPadding(
                  padding: const EdgeInsets.symmetric(vertical: 12.0),
                  sliver: new SliverList(
                    delegate: new SliverChildBuilderDelegate(
                      (context, index) => new TicketRow(ticketList[index]),
                      childCount: ticketList.length,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );

    return new Scaffold(
      appBar: AppBar(
        backgroundColor: ColorLibrary.backgroundDark,
        elevation: 0.3,
        leading: new Container(),
        actions: <Widget>[
          new IconButton(
            padding: EdgeInsets.only(right: 27.0),
            icon: Icon(Icons.history),
            onPressed: () => _moveToHistory(),
          )
        ],
      ),
      body: _body,
    );
  }

  void _moveToHistory() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => HistoryOrderPage(),
      ),
    );
  }
}
