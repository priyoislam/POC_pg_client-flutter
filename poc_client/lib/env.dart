import 'package:flutter/material.dart';
import 'package:poc_client/data.dart';
import 'package:poc_client/login.dart';
import 'package:event_bus/event_bus.dart';
import 'package:poc_client/main.dart';


abstract class Environment {

//   eventBus.on().listen((event) {
   
// });
eventBus.on().listen((event) {
  // Print the runtime type. Such a set up could be used for logging.
  print(event.runtimeType);
});

}

class Userdata {
  String? name;
  String? timeVal; //= "01.00";
  int? ampmindex;
  String? localVal;
  Userdata(this.name, this.timeVal, this.ampmindex, this.localVal);
  
}
