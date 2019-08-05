import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_parking_project/models/location_model.dart';
import 'package:flutter_parking_project/views/widget/location_listview.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class LocationSearchPage extends StatefulWidget {
  @override
  _LocationSearchPageState createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage>
    with TickerProviderStateMixin {
  Color _mainColor = Color(0xFFF48023);
  final TextEditingController _filter = new TextEditingController();
  final model = new Location_model();
  Icon _searchIcon = new Icon(Icons.search);
  Widget _appbarTitle = new Text("Location");
  List filteredNames = new List();
  List names = new List();

  ScrollController scrollController;
  bool dialVisible = true;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController()
      ..addListener(() {
        setDialVisible(scrollController.position.userScrollDirection ==
            ScrollDirection.forward);
      });
  }

  void setDialVisible(bool value) {
    setState(() {
      dialVisible = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget _tabWidget = new TabBar(
      labelColor: Colors.white,
      unselectedLabelColor: Colors.black26,
      tabs: <Widget>[
        new Tab(
          child: Text(
            "all",
          ),
        ),
        new Tab(
          text: "favourite",
        )
      ],
    );

    Widget _bodyTabFirst = new Scaffold(
      body: new Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          Container(
            child: LocationListview(),
          ),
          buildSpeedDial(),
        ],
      ),
    );

    Widget _bodyTabSecond = new Scaffold(
      body: new Stack(
        alignment: Alignment.bottomRight,
        children: <Widget>[
          Container(
            child: LocationListview(),
          ),
        ],
      ),
    );

    Widget _body = new TabBarView(
      children: <Widget>[_bodyTabFirst, _bodyTabSecond],
    );

    Widget _compileWidget = new DefaultTabController(
      length: 2,
      child: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              actions: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: 15.0),
                  child: IconButton(
                    icon: _searchIcon,
                    onPressed: _searchPressed,
                  ),
                )
              ],
              backgroundColor: _mainColor,
              title: _appbarTitle,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(),
              bottom: _tabWidget,
            ),
          ];
        },
        body: _body,
      ),
    );

    return _compileWidget;
  }

  void _getNames() async {
    // final response =
  }

  void _searchPressed() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = new Icon(Icons.close);
        this._appbarTitle = new TextField(
          controller: _filter,
          decoration: new InputDecoration(
            prefixIcon: new Icon(
              Icons.search,
              color: Colors.black26,
            ),
            hintText: 'Search...',
            focusedBorder: UnderlineInputBorder(
              borderSide: const BorderSide(color: Colors.white),
            ),
          ),
        );
      } else {
        this._searchIcon = new Icon(Icons.search);
        this._appbarTitle = new Text('Location');
        filteredNames = names;
        _filter.clear();
      }
    });
  }

  SpeedDial buildSpeedDial() {
    return SpeedDial(
      marginBottom: 30.0,
      marginRight: 25.0,
      animatedIcon: AnimatedIcons.menu_close,
      animatedIconTheme: IconThemeData(size: 22.0),
      visible: dialVisible,
      curve: Curves.bounceIn,
      backgroundColor: _mainColor,
      children: [
        SpeedDialChild(
          child: Icon(Icons.accessibility, color: Colors.white),
          backgroundColor: Colors.deepOrangeAccent,
          onTap: () => print('FIRST CHILD'),
        ),
        SpeedDialChild(
          child: Icon(Icons.motorcycle, color: Colors.white),
          backgroundColor: Colors.deepOrange,
          onTap: () => print('SECOND CHILD'),
        ),
        SpeedDialChild(
          child: Icon(Icons.drive_eta, color: Colors.white),
          backgroundColor: Colors.deepOrangeAccent,
          onTap: () => print('THIRD CHILD'),
        ),
      ],
    );
  }
}
