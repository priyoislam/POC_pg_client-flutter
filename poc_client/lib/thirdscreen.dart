import 'package:flutter/material.dart';
import 'dart:async';

import 'package:poc_client/restapifetch.dart';
import 'package:poc_client/restapisend.dart';

//import 'package:toggle_switch/toggle_switch.dart';

class ThirdScreen extends StatefulWidget {
  //ThirdScreen({Key key}) : super(key: key);
  @override
  ThirdScreenState createState() {
    return ThirdScreenState();
  }
}

Future<Album> futureAlbum;
Future<void> futureAlbum2;

class ThirdScreenState extends State<ThirdScreen> {
  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    //futureAlbum = fetchAlbum();

    futureAlbum2 = senddata();
  }

//String s=((ampmHolder == 0) ? "Good Evening": "Good Morning");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //title: Text("Second Activity Screen"),
            ),
        body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //return Text(snapshot.data.userId.toString());
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Center(
                                child: Text(
                              snapshot.data.title,
                              style: TextStyle(fontSize: 22),
                              textAlign: TextAlign.center,
                            )),
                          ]);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () => goBack(context),
                // color: Colors.lightBlue,
                // textColor: Colors.white,
                child: Text('Go Back To Previous  Screen'),
              )
            ]));
  }
}
