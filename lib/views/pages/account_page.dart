import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    Widget _carouselWidget = Container(
      padding: EdgeInsets.only(top: 25.0),
      child: SizedBox(
        width: 300.0,
        height: 150.0,
        child: Carousel(
          images: [
            NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
            NetworkImage('https://cdn-images-1.medium.com/max/2000/1*wnIEgP1gNMrK5gZU7QS0-A.jpeg'),
            NetworkImage('https://cdn-images-1.medium.com/max/2000/1*GqdzzfB_BHorv7V2NV7Jgg.jpeg'),
          ],
        ),
      ),
    );
    Widget _compileWidget = Container(
      child: Column(
        children: <Widget>[
          _carouselWidget,
        ],
      ),
    );

    return _compileWidget;
  }
}