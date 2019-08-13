import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/lot_model.dart';

class LotSelectPage extends StatefulWidget {
  @override
  _LotSelectPageState createState() => _LotSelectPageState();
}

class _LotSelectPageState extends State<LotSelectPage> {
  LotModel _lotModel;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        title: Text("data"),
      ),
      body: new Container(
        child: new Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: new Scaffold(
                body: new Container(
                  child: new CustomScrollView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    slivers: <Widget>[
                      new SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        sliver: new SliverList(
                          delegate: new SliverChildBuilderDelegate(
                              (context, index) => ListviewLeft(LotList[index]),
                              childCount: LotList.length),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: new Scaffold(
                body: new Container(
                  child: new CustomScrollView(
                    scrollDirection: Axis.vertical,
                    shrinkWrap: false,
                    slivers: <Widget>[
                      new SliverPadding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        sliver: new SliverList(
                          delegate: new SliverChildBuilderDelegate(
                              (context, index) => ListviewRight(LotList[index]),
                              childCount: LotList.length),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ListviewLeft extends StatelessWidget {
  LotModel _lotModel;
  ListviewLeft(this._lotModel);
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    Widget _child = new Row(
      children: <Widget>[
        Checkbox(
          value: _isSelected,
          onChanged: (bool value) {
            _lotModel.onChange(value);
          },
        ),
        Container(
          width: 3.0,
        ),
        Text(_lotModel.nameLot)
      ],
    );
    return _child;
  }
}

class ListviewRight extends StatelessWidget {
  LotModel _lotModel;
  ListviewRight(this._lotModel);
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    Widget _child;
    //if (_lotModel.sideTypeLot == "B") {
    _child = new Row(
      children: <Widget>[
        Text(_lotModel.nameLot),
        Container(
          width: 3.0,
        ),
        Checkbox(
          value: _isSelected,
          onChanged: (bool value) {
            _lotModel.onChange(value);
          },
        ),
      ],
    );
    // } else {
    //   _child = Text("");
    // }
    return _child;
  }
}
