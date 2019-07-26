import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/ticket.dart';
import 'package:flutter_parking_project/views/widget/ticket_row.dart';

class OrderPage2 extends StatelessWidget {
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {
    return new Expanded(
      child: new Container(
        color: _mainColor,
        child: new CustomScrollView(
          scrollDirection: Axis.vertical,
          shrinkWrap: false,
          slivers: <Widget>[
            new SliverPadding(
              padding: const EdgeInsets.symmetric(vertical: 24.0),
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
    );
  }
}