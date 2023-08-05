// @dart=2.9
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:poc_client/restapisend.dart';
import 'package:poc_client/eventbus.dart';
import 'package:poc_client/secondscreen.dart';
import 'package:poc_client/data.dart';

class Loginbtn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MyData>(context);

    Future<void> futureA;

    return Container(
      width: MediaQuery.of(context).size.width * .5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                Kafkadata();
                hub.send(data);

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(
                              nameHolder: data.name,
                              timeHolder: data.timeVal,
                              ampmHolder: data.ampm,
                              localeHolder: data.localVal,
                            )));
              },
              child: Text('Log In'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
