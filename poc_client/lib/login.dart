// @dart=2.9
import 'package:flutter/material.dart';
import 'package:poc_client/finalpage.dart';
// import 'package:poc_client/name.dart';
// import 'package:poc_client/time.dart';
// import 'package:poc_client/locale.dart';
import 'package:poc_client/main.dart';
import 'package:poc_client/data.dart';
import 'package:provider/provider.dart';
import 'package:event_bus/event_bus.dart';
import 'package:poc_client/env.dart';

class Loginbtn extends StatelessWidget {
  //var formKey = GlobalKey<FormState>();
  //username(this.formKey);
  // String nm = "22";

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MyData>(context);

    return Container(
      width: MediaQuery.of(context).size.width * .5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                //getItemAndNavigate(BuildContext context) {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SecondScreen(
                              nameHolder: data.name,
                              timeHolder: data.timeVal,
                              ampmHolder: data.ampm,
                              localeHolder: data.localVal,
                            )));
                eventBus.fire(Userdata(
                    data.name, data.timeVal, data.ampm, data.localVal));
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
