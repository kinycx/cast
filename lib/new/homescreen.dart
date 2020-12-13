import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget{
  @override
  _HomeScreenState createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen>{

  final textStyle = TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Text("Cosa vorresti", style: textStyle),
                  Text("mangiare?", style: textStyle,)
                ],
              ),
              Icon(Icons.notifications_none, size:30.0, color: Theme.of(context).primaryColor,),
            ],
          )
        ],
      ),
    );
  }
}