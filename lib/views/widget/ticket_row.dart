import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/ticket.dart';
import 'package:flutter_parking_project/views/pages/detail_ticket_page.dart';
import 'package:flutter_parking_project/views/pages/login_page.dart';

class TicketRow extends StatelessWidget {
  final Ticket ticket;
  TicketRow(this.ticket);
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {

    final TicketThumbnailIcon = new ListTile(
      contentPadding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 22.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 2.0, color: Colors.white24)),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.drive_eta,
              color: Colors.white,
            ),
            Text('R 8655 BS', style: TextStyle(color: Colors.white, fontSize: 10),)
          ],
        ),
      ),
      onTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailTicketPage()));
      },
    );

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 10.0);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 14.0, fontWeight: FontWeight.w600);

    final TicketCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(90.0, 16.0, 16.0, 16.0),
      constraints: new BoxConstraints.expand(),
      child: new Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          new Container(height: 4.0),
          new Text(ticket.nameLocation, style: headerTextStyle),
          new Container(height: 10.0),
          new Text(ticket.dateTransaction, style: subHeaderTextStyle),
          new Container(
              margin: new EdgeInsets.symmetric(vertical: 8.0),
              height: 2.0,
              width: 18.0,
              color: new Color(0xff00c6ff)),
          new Row(
            children: <Widget>[
              Container(
                width: 8.0,
              ),
              Expanded(
                child: Text(
                  ticket.durationTransaction,
                  style: regularTextStyle,
                ),
              ),
              Container(
                width: 8.0,
              ),
              Expanded(
                child: Text(
                  ticket.statusTransaction,
                  style: regularTextStyle,
                ),
              ),
            ],
          ),
        ],
      ),
    );

    final TicketCard = new Container(
      child: TicketCardContent,
      height: 124.0,
      margin: new EdgeInsets.only(left: 10.0, right: 10.0),
      decoration: new BoxDecoration(
        color: new Color(0xFF333366),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black12,
            blurRadius: 10.0,
            offset: new Offset(0.0, 10.0),
          ),
        ],
      ),
    );

    return new Container(
        height: 120.0,
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
          horizontal: 14.0,
        ),
        child: new Stack(
          children: <Widget>[
            TicketCard,
            // TicketThumbnailRight,
            // TicketThumbnailLeft,
            TicketThumbnailIcon
          ],
        ));

    void _moveToLogin() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new LoginPage(),
    ));
  }

  }
}