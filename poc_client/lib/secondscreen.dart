import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:poc_client/restapifetch.dart';
import 'package:poc_client/restapisend.dart';
import 'package:poc_client/thirdscreen.dart';
//import 'package:toggle_switch/toggle_switch.dart';
import 'package:poc_client/login.dart';

class SecondScreen extends StatefulWidget {
  final nameHolder;
  final timeHolder;
  final ampmHolder;
  final localeHolder;

  SecondScreen(
      {Key key,
      @required this.nameHolder,
      this.timeHolder,
      this.ampmHolder,
      this.localeHolder})
      : super(key: key);

  @override
  SecondScreenState createState() {
    return SecondScreenState();
  }
}

class SecondScreenState extends State<SecondScreen> {
  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    //futureAlbum = fetchAlbum();
    //futureAlbum2 = createAlbum(widget.nameHolder);
  }

//String s=((ampmHolder == 0) ? "Good Evening": "Good Morning");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Second Activity Screen"),
        ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                  child: Text(
                ((widget.ampmHolder == 0) ? "Good Evening" : "Good Morning") +
                    '  ' +
                    widget.nameHolder,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )),
              Center(
                  child: Text(
                'Time = ' +
                    widget.timeHolder +
                    (((widget.ampmHolder) == 0) ? " AM" : " PM"),
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )),
              Center(
                  child: Text(
                'Country = ' + widget.localeHolder,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ThirdScreen()),
                  );
                },
                child: Text('Data Send and Fetch'),
                // style: ElevatedButton.styleFrom(
                //     padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                //     textStyle:
                //         TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              ElevatedButton(
                onPressed: () => goBack(context),
                // color: Colors.lightBlue,
                // textColor: Colors.white,
                child: Text('Go Back To Previous Screen'),
              )
            ]));
  }
}
