import 'package:flutter/material.dart';
import 'package:poc_client/data.dart';
import 'package:poc_client/login.dart';
import 'package:event_bus/event_bus.dart';
import 'package:poc_client/main.dart';
import 'package:provider/provider.dart';
//import 'package:kafka/kafka.dart';
//import 'dart:ffi';

// Future<void> kaf() async {
//   var config = ProducerConfig(bootstrapServers: ['127.0.0.1:9092']);
//   var producer =
//       Producer<String, String>(StringSerializer(), StringSerializer(), config);

//   for (var i = 0; i < 10; i++) {
//     // Loop through a list of partitions.
//     for (var p in [1]) {
//       var rec = ProducerRecord('Topic1', p, 'key:${p},$i', 'value:${p},$i');
//       producer.add(rec);
//       rec.result.then(print);
//     }
//   }
//   await producer.close();
// }

class Environment {
  //final data = Provider.of<MyData>(context);
  Environment() {
    eventBus.on<Userdata>().listen((event) {
      // All events are of type UserLoggedInEvent (or subtypes of it).
      print(event.name);
    });
  }
}

class Userdata {
  String name;
  String timeVal; //= "01.00";
  int ampmindex;
  String localVal;
  Userdata(this.name, this.timeVal, this.ampmindex, this.localVal);
}
