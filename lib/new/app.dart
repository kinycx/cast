import 'package:cast/new/homescreen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cast",
      theme: ThemeData(
        primaryColor: Colors.blueAccent
      ),
      home: HomeScreen(),
    );
  }
}