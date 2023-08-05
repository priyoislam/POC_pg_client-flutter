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

class ThirdScreenState extends State<ThirdScreen> {
  goBack(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

//String s=((ampmHolder == 0) ? "Good Evening": "Good Morning");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            //title: Text("Second Activity Screen"),
            ),
        body: Center(
          child: Container(
              margin: EdgeInsets.all(5.0),
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              width: MediaQuery.of(context).size.width * .5,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black38),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(children: [
                FutureBuilder<Album>(
                  future: futureAlbum,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      //return Text(snapshot.data.userId.toString());

                      return Expanded(
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: snapshot.data.val.length,
                          itemBuilder: (context, index) => Card(
                            child: ListTile(
                              title: Text(
                                  "Name: ${snapshot.data.val[index].userdata.name}"),
                              subtitle: snapshot
                                          .data.val[index].userdata.ampmindex ==
                                      0
                                  ? Text(
                                      'Time: ${snapshot.data.val[index].userdata.timeVal} AM , Country: ${snapshot.data.val[index].userdata.localVal}') //code if above statement is true
                                  : Text(
                                      'Time: ${snapshot.data.val[index].userdata.timeVal} PM , Country: ${snapshot.data.val[index].userdata.localVal}'),
                            ),
                          ),
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return CircularProgressIndicator();
                  },
                ),
                ElevatedButton(
                  onPressed: () => goBack(context),
                  // color: Colors.lightBlue,
                  // textColor: Colors.white,
                  child: Text('Go Back To Previous  Screen'),
                )
              ])),
        ));
  }
}
