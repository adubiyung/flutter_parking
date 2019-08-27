import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_parking_project/views/pages/lot_select_page.dart';
import 'package:flutter_parking_project/views/pages/topup_page.dart';
import 'package:flutter_parking_project/views/pages/vehicle_page.dart';
import 'package:sliver_fab/sliver_fab.dart';
import 'package:intl/intl.dart';

class LocationDetailPage extends StatefulWidget {
  @override
  _LocationDetailPageState createState() => _LocationDetailPageState();
}

class _LocationDetailPageState extends State<LocationDetailPage> {
  String textLot = "data";
  Duration initialtimer = new Duration();
  static DateFormat _dateFormat = DateFormat("dd-MM-yyyy");
  String dateSelect = _dateFormat.format(new DateTime.now());
  String timeSelect = "How Many Hour?";

  @override
  Widget build(BuildContext context) {
    Widget _locationWidget = new Card(
      child: new Padding(
        padding: EdgeInsets.all(5.0),
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Taman Kesehatan",
              style: TextStyle(fontSize: 23, fontFamily: 'Work Sans', fontWeight: FontWeight.w500),
            ),
            Container(
              height: 5.0,
            ),
            Text(
                "Jl. Boulevard BSD Tim., Lengkong Gudang, Kec. Serpong, Kota Tangerang Selatan, Banten 15321",
                style: TextStyle(fontSize: 14, fontFamily: 'Work Sans', fontWeight: FontWeight.w300),),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Card(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.drive_eta,
                            size: 40,
                          ),
                          Text("12 " + "lot", style: TextStyle(fontSize: 12, ),)
                        ],
                      ),
                    ),
                    Card(
                      child: Column(
                        children: <Widget>[
                          Icon(
                            Icons.motorcycle,
                            size: 40,
                          ),
                          Text("12 " + "lot")
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );

    Widget _chooseVehicleWidget = new ListTile(
      leading: Container(
        height: 25.0,
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.event_seat,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      title: Text("select vehicle"),
      trailing: Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(Icons.arrow_forward_ios),
      ),
      onTap: () {
        _moveToVehicle();
      },
    );

    Widget _chooseLotWidget = new ListTile(
      leading: Container(
        height: 25.0,
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.compare_arrows,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      title: Text("select lot"),
      trailing: Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(Icons.arrow_forward_ios),
      ),
      onTap: () {
        _moveToSelectLot();
      },
    );

    Widget _chooseStartWidget = new ListTile(
      leading: Container(
        height: 25.0,
        padding: EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(width: 1.0, color: Colors.grey),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.access_time,
              color: Colors.grey,
            ),
          ],
        ),
      ),
      title: Text(dateSelect),
      trailing: Padding(
        padding: EdgeInsets.only(right: 12.0),
        child: Icon(Icons.arrow_forward_ios),
      ),
    );

    Widget _chooseDurationWidget = new ListTile(
        leading: Container(
          height: 25.0,
          padding: EdgeInsets.only(right: 12.0),
          decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: 1.0, color: Colors.grey),
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.timelapse,
                color: Colors.grey,
              ),
            ],
          ),
        ),
        title: Text(timeSelect),
        trailing: Padding(
          padding: EdgeInsets.only(right: 12.0),
          child: Icon(Icons.arrow_forward_ios),
        ),
        onTap: () {
          showModalBottomSheet(
            context: context,
            builder: (BuildContext builder) {
              return Container(
                height: MediaQuery.of(context).copyWith().size.height / 3,
                child: CupertinoTimerPicker(
                  mode: CupertinoTimerPickerMode.hm,
                  minuteInterval: 1,
                  secondInterval: 1,
                  initialTimerDuration: initialtimer,
                  onTimerDurationChanged: (Duration changedtimer) {
                    setState(() {
                      initialtimer = changedtimer;
                      String hasil = "$initialtimer".substring(0, 4);
                      print(hasil);
                      if (hasil == "0:00") {
                        timeSelect = "How Many Hours?";
                      } else {
                        timeSelect = hasil;
                      }
                    });
                  },
                ),
              );
            },
          );
        });

    Widget _firstColumnWidget = new Card(
      margin: EdgeInsets.only(right: 10.0, left: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _chooseVehicleWidget,
          Divider(
            color: Colors.grey,
            height: 2.0,
          ),
          _chooseLotWidget
        ],
      ),
    );

    Widget _secondColumnWidget = new Card(
      margin: EdgeInsets.only(right: 10.0, left: 10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _chooseStartWidget,
          Divider(
            color: Colors.grey,
            height: 2.0,
          ),
          _chooseDurationWidget
        ],
      ),
    );

    Widget _thirdColumnWidget = new Card(
      margin: EdgeInsets.only(right: 10.0, left: 10.0),
      child: Container(
        height: 70.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            GestureDetector(
              child: new Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.monetization_on,
                        size: 15,
                      ),
                      Container(
                        width: 3.0,
                      ),
                      Text("LinkAJa")
                    ],
                  ),
                  new Container(
                    height: 7.0,
                  ),
                  new Text("Rp 300.000"),
                ],
              ),
              onTap: () {
                _moveToTopup();
              },
            ),
            Container(
              height: 25.0,
              padding: EdgeInsets.only(right: 12.0),
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.local_play,
                      size: 15,
                    ),
                    Container(
                      width: 3.0,
                    ),
                    Text("Voucher"),
                  ],
                ),
                Container(
                  height: 7.0,
                ),
                Text("kodevoucher"),
              ],
            ),
          ],
        ),
      ),
    );

    Widget _buttonWidget = new Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        children: <Widget>[
          ButtonTheme(
            minWidth: double.infinity,
            height: 50.0,
            child: RaisedButton(
              child: Text("booking"),
              onPressed: () {
                print("object");
              },
            ),
          ),
        ],
      ),
    );

    Widget _compileBottomWidget = new Center(
      child: new SingleChildScrollView(
        child: new Container(
          // margin: EdgeInsets.only(top: 50.0),
          color: Colors.black,
          child: new Column(
            children: <Widget>[
              Container(
                height: 15.0,
              ),
              _locationWidget,
              Container(
                height: 15.0,
              ),
              _firstColumnWidget,
              Container(
                height: 15.0,
              ),
              _secondColumnWidget,
              Container(
                height: 15.0,
              ),
              _thirdColumnWidget,
            ],
          ),
        ),
      ),
    );

    Widget _compileWidget = new Scaffold(
      body: new Builder(
        builder: (context) => new SliverFab(
          floatingWidget: FloatingActionButton(
            onPressed: () {
              print("object");
            },
            child: Icon(Icons.map),
          ),
          floatingPosition: FloatingPosition(right: 16.0),
          expandedHeight: 200.0,
          slivers: <Widget>[
            new SliverAppBar(
              expandedHeight: 200.0,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Collapsing Toolbar",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
                background: Image.network(
                  "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                  fit: BoxFit.cover,
                ),
              ),
            ),
            //isi
          ],
        ),
      ),
    );
    return new NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool isScrolled) {
        return <Widget>[
          SliverAppBar(
            expandedHeight: 200.0,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Taman Kesehatan"),
              background: Image.network(
                "",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ];
      },
      body: new Column(
        children: <Widget>[
          Expanded(
            child: _compileBottomWidget,
          ),
          _buttonWidget,
        ],
      ),
    );
  }

  void _moveToSelectLot() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new LotSelectPage(),
    ));
  }

  void _moveToVehicle() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new VehiclePage(),
    ));
  }

  void _moveToTopup() {
    Navigator.of(context).push(PageRouteBuilder(
      maintainState: true,
      opaque: true,
      pageBuilder: (context, _, __) => new TopupPage(),
    ));
  }
}
