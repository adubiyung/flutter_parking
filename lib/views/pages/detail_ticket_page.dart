import 'package:flutter/material.dart';

class DetailTicketPage extends StatefulWidget {
  @override
  _DetailTicketPageState createState() => _DetailTicketPageState();
}

class _DetailTicketPageState extends State<DetailTicketPage> {
  Color _mainColor = Color(0xFFF48023);

  @override
  Widget build(BuildContext context) {
    Widget _logoWidget = Container(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(
          top: 35.0,
          bottom: 35.0,
        ),
        child: Icon(Icons.drive_eta),
      ),
    );

    Widget _topCardContent = Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text('Booking Parking'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 10.0),
            child: Container(
              alignment: Alignment.center,
              width: double.infinity,
              child: Text('No. EPT - 2255252852255'),
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('10 Jan 2018'),
                    Container(
                      height: 5.0,
                    ),
                    Text('10.00 - 12.00')
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('On Going'),
                  ],
                ),
              ),
              Container(
                width: 15.0,
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Row(
            children: <Widget>[
              Container(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Total Price'),
                    Container(
                      height: 5.0,
                    ),
                    Text('Total Price'),
                    Container(
                      height: 5.0,
                    ),
                    Text('Total Price'),
                    Container(
                      height: 5.0,
                    ),
                    Text('Total Price'),
                    Container(
                      height: 5.0,
                    ),
                    Text('Total Price'),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Text('Rp 40.000'),
                    Container(
                      height: 5.0,
                    ),
                    Text('Rp 40.000'),
                    Container(
                      height: 5.0,
                    ),
                    Text('Rp 40.000'),
                    Container(
                      height: 5.0,
                    ),
                    Text('Rp 40.000'),
                    Container(
                      height: 5.0,
                    ),
                    Text('Rp 40.000'),
                  ],
                ),
              ),
              Container(
                width: 15.0,
              )
            ],
          ),
        ],
      ),
    );

    Widget _topCardWidget = Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        // elevation: 10.0,
        child: _topCardContent,
      ),
    );

    Widget _bottomCardContent = Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            width: 150.0,
            height: 150.0,
            color: Colors.black,
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0, bottom: 5.0),
            width: double.infinity,
            child: Text(
              '915586',
            ),
            alignment: Alignment.center,
          ),
          Container(
            padding: EdgeInsets.only(bottom: 5.0),
            alignment: Alignment.center,
            child: Text('Scan this code for check-in and check-out'),
          ),
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Divider(
              color: Colors.black,
            ),
          ),
          Column(
            children: <Widget>[
              Text('Taman Kesehatan', style: TextStyle(fontSize: 25.0),),
              Container(
                height: 5.0,
              ),
              Text(
                  'Jl. Boulevard BSD Timur, Lengkong Gudang, Kec Serpong, Kota Tangerang Selatan, Banten'),
            ],
          ),
        ],
      ),
    );

    Widget _bottomCardWidget = Padding(
      padding: EdgeInsets.only(left: 20.0, right: 20.0),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: _bottomCardContent,
      ),
    );

    Widget _compileWidget = Scaffold(
      backgroundColor: Colors.white24,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: AppBar(
          title: Text('Detail Order'),
          backgroundColor: _mainColor,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 35.0),
          child: Column(
            children: <Widget>[_logoWidget, _topCardWidget, _bottomCardWidget],
          ),
        ),
      ),
    );

    return _compileWidget;
  }
}
