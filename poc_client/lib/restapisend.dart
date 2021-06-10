import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:event_bus/event_bus.dart';
import 'package:poc_client/env.dart';
import 'package:poc_client/main.dart';
import 'package:poc_client/thirdscreen.dart';
import 'package:poc_client/eventbus.dart';
import 'package:poc_client/data.dart';

Future<void> senddata() async {
  String name;
  String timeVal; //= "01.00";
  int ampmindex;
  String localVal;

  hub.on<Userdata>().listen((event) {
    name = event.name;
    print("Send " + name);
    timeVal = event.timeVal;
    ampmindex = event.ampmindex;
    localVal = event.localVal;
  });

  name = "sadad";
  print("Send " + name);

  print("Send ap " + localVal);
  final response = await http.post(
    Uri.parse('http://127.0.0.1:8082/topics/clientdata'),
    headers: <String, String>{
      'Content-Type': 'application/vnd.kafka.json.v2+json',
    },
    body: jsonEncode({
      "records": [
        {
          "value": {
            "name": name,
            "time": timeVal,
            "ampm": ampmindex,
            "country": localVal,
          }
        }
      ]
    }),
  );

  print(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print("send data" + response.body);
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

// class Album2 {
//   var offset;

//   //Album2({@required this.id, @required this.title});
//   Album2({@required this.offset});

//   factory Album2.fromJson(Map<String, dynamic> json) {
//     return Album2(
//       offset: "hgh",
//     );
//   }
// }
