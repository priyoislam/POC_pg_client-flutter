import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
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
Future<Album2> futureAlbum2;

class ThirdScreenState extends State<ThirdScreen> {
  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
    // futureAlbum2 = createAlbum("The Title");
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
                              snapshot.data.title + " sadaa",
                              style: TextStyle(fontSize: 22),
                              textAlign: TextAlign.center,
                            )),
                            // Center(
                            //     child: Text(
                            //   snapshot.data.id.toString(),
                            //   style: TextStyle(fontSize: 22),
                            //   textAlign: TextAlign.center,
                            // )),
                            // Center(
                            //     child: Text(
                            //   snapshot.data.userId.toString(),
                            //   style: TextStyle(fontSize: 22),
                            //   textAlign: TextAlign.center,
                            // )),
                          ]);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return CircularProgressIndicator();
                  },
                ),
              ),
              // Center(
              //   child: FutureBuilder<Album2>(
              //     future: futureAlbum2,
              //     builder: (context, snapshot) {
              //       if (snapshot.hasData) {
              //         return Text("Send Data " + snapshot.data.id);
              //       } else if (snapshot.hasError) {
              //         return Text('${snapshot.error}');
              //       }

              //       return CircularProgressIndicator();
              //     },
              //   ),
              // ),
              // Center(
              //     child: Text(
              //   fetchdata.getid().toString(),
              //   style: TextStyle(fontSize: 22),
              //   textAlign: TextAlign.center,
              // )),

              ElevatedButton(
                onPressed: () => goBack(context),
                // color: Colors.lightBlue,
                // textColor: Colors.white,
                child: Text('Go Back To Previous Screen'),
              )
            ]));
  }
}
