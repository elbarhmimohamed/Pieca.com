import 'package:flutter/material.dart';
import 'package:pieca/View/Auth/login.dart';
import 'package:pieca/View/home/components/body.dart';

class MyinfoPage extends StatefulWidget {
  //const MyinfoPage({Key key}) : super(key: key);

  @override
  _MyinfoPageState createState() => _MyinfoPageState();
}

class _MyinfoPageState extends State<MyinfoPage> {
  @override
  Widget build(BuildContext context) {
    List<Widget> _widgetList = <Widget>[
      MyhomBbody(),
      Login_View(),
      MyinfoPage(),
    ];
    int _currentindex = 2;
    Size size = MediaQuery.of(context).size;
    return Scaffold();
  }
}
