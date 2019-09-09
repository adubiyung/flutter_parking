import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/ticket.dart';
import 'package:flutter_parking_project/views/widget/color_library.dart';
import 'package:flutter_parking_project/views/widget/ticket_row.dart';

class HistoryOrderPage extends StatefulWidget {
  @override
  _HistoryOrderPageState createState() => _HistoryOrderPageState();
}

class _HistoryOrderPageState extends State<HistoryOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorLibrary.backgroundDark,
        title: Text("History Orders"),
      ),
      body: new Column(
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
      ),
    );
  }
}
