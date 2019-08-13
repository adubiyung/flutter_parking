import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/ticket.dart';
import 'package:flutter_parking_project/views/widget/ticket_row.dart';

class OrderListview extends StatelessWidget {
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
            SliverAppBar(
              title: Text("Orders"),
              backgroundColor: _mainColor,
              pinned: true,
              leading: new Container(),
              // expandedHeight: 80.0,
              // flexibleSpace: FlexibleSpaceBar(
              //   background: Image.network(
              //       'https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
              // ),
            ),
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
    );
  }
}
