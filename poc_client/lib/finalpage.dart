import 'package:flutter/material.dart';
//import 'package:toggle_switch/toggle_switch.dart';

class SecondScreen extends StatelessWidget {
  final nameHolder;
  final timeHolder;
  final ampmHolder;
  final localeHolder;

  SecondScreen(
      {Key? key,
      @required this.nameHolder,
      this.timeHolder,
      this.ampmHolder,
      this.localeHolder})
      : super(key: key);

  goBack(BuildContext context) {
    Navigator.pop(context);
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
                ((ampmHolder == 0) ? "Good Evening" : "Good Morning") +
                    '  ' +
                    nameHolder,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )),
              Center(
                  child: Text(
                'Time = ' + timeHolder + (((ampmHolder) == 0) ? " AM" : " PM"),
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )),
              Center(
                  child: Text(
                'Country = ' + localeHolder,
                style: TextStyle(fontSize: 22),
                textAlign: TextAlign.center,
              )),
              ElevatedButton(
                onPressed: () => goBack(context),
                // color: Colors.lightBlue,
                // textColor: Colors.white,
                child: Text('Go Back To Previous Screen'),
              )
            ]));
  }
}
