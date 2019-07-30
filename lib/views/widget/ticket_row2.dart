import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/ticket.dart';

class TicketRow2 extends StatelessWidget {
  final Ticket ticket;
  TicketRow2(this.ticket);
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {
    final TicketThumbnailLeft = new Container(
      margin: new EdgeInsets.symmetric(vertical: 30.0),
      alignment: FractionalOffset.centerLeft,
      width: 25.0,
      height: 80.0,
      decoration: new BoxDecoration(
        color: _mainColor,
        shape: BoxShape.circle,
        boxShadow: [BoxShadow(color: _mainColor, offset: Offset.zero)],
      ),
    );

    final TicketThumbnailIcon = new ListTile(
      // contentPadding: EdgeInsets.symmetric(vertical: 10.0),
      leading: Container(
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(right: BorderSide(width: 1.0, color: Colors.white24)),
        ),
        child: Icon(
          Icons.drive_eta,
          color: Colors.white,
        ),
      ),
    );

    final TicketThumbnailRight = new Container(
      margin: new EdgeInsets.only(left: 288),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30.0),
        alignment: FractionalOffset.centerRight,
        width: 80.0,
        height: 80.0,
        decoration: new BoxDecoration(
          color: _mainColor,
          shape: BoxShape.circle,
        ),
      ),
    );

    final baseTextStyle = const TextStyle(fontFamily: 'Poppins');
    final regularTextStyle = baseTextStyle.copyWith(
        color: const Color(0xffb6b2df),
        fontSize: 9.0,
        fontWeight: FontWeight.w400);
    final subHeaderTextStyle = regularTextStyle.copyWith(fontSize: 12.0);
    final headerTextStyle = baseTextStyle.copyWith(
        color: Colors.white, fontSize: 18.0, fontWeight: FontWeight.w600);

    Widget _TicketValue({
      String value,
      /*String image*/
    }) {
      return new Row(children: <Widget>[
        //new Image.asset(image, height: 12.0),
        new Container(width: 8.0),
        new Text(ticket.durationTransaction, style: regularTextStyle),
      ]);
    }

    final TicketContent = new Container(
      child: new Column(
        children: <Widget>[
          Container(
            child: TicketThumbnailIcon,
          ),
          Container(
            margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
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
                    Expanded(
                        child: _TicketValue(
                      value: ticket.durationTransaction,
                    )),
                    new Expanded(
                        child: _TicketValue(
                      value: ticket.statusTransaction,
                    )),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );

    final TicketCardContent = new Container(
      margin: new EdgeInsets.fromLTRB(76.0, 16.0, 16.0, 16.0),
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
              Expanded(
                  child: _TicketValue(
                value: ticket.durationTransaction,
              )),
              new Expanded(
                  child: _TicketValue(
                value: ticket.nameWarden,
              )),
            ],
          ),
        ],
      ),
    );

    final TicketCard = new Container(
      // child: TicketCardContent,
      child: TicketContent,
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
          vertical: 16.0,
          horizontal: 24.0,
        ),
        child: new Stack(
          children: <Widget>[
            TicketCard,
            TicketThumbnailRight,
            TicketThumbnailLeft,
          ],
        ));
  }
}
