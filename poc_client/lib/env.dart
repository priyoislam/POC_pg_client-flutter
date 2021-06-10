import 'package:flutter/material.dart';
import 'package:poc_client/data.dart';
import 'package:poc_client/login.dart';
import 'package:event_bus/event_bus.dart';
import 'package:poc_client/main.dart';
import 'package:provider/provider.dart';
import 'package:poc_client/eventbus.dart';

class Environment {
  //final data = Provider.of<MyData>(context);
  Environment() {
    // eventBus.on<Userdata>().listen((event) {});
    // hub.on<MyData>().listen((event) {
    //   // All events are of type UserLoggedInEvent (or subtypes of it).
    //   //print(event.name);
    // });
  }
}

class Userdata {
  String name;
  String timeVal; //= "01.00";
  int ampmindex;
  String localVal;
  Userdata(this.name, this.timeVal, this.ampmindex, this.localVal);
}
