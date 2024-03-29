import 'package:flutter/material.dart';
import 'package:flutter_parking_project/models/lot_model.dart';

class LotRow extends StatelessWidget {
  final LotModel _lotModel;
  LotRow(this._lotModel);
  final bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: <Widget>[
          Text(_lotModel.nameLot),
          Container(
            width: 6.0,
          ),
          Checkbox(
            value: _isSelected,
            onChanged: (bool value) {
                _lotModel.onChange(value);
            },
          ),
        ],
      ),
    );
  }
}
