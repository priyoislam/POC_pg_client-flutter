import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';

Future<Album> fetchAlbum() async {
  final consumer = await http.post(
    Uri.parse('http://127.0.0.1:8082/consumers/flutterconsumer'),
    headers: <String, String>{
      'Content-Type': 'application/vnd.kafka.v2+json',
    },
    body: jsonEncode({
      "name": "my_consumer",
      "format": "json",
      "auto.offset.reset": "earliest",
      "auto.commit.enable": "false"
    }),
  );
  print("consumer ${consumer.statusCode}");

  final subscription = await http.post(
    Uri.parse(
        'http://127.0.0.1:8082/consumers/flutterconsumer/instances/my_consumer/subscription'),
    headers: {
      'Content-Type': 'application/vnd.kafka.v2+json',
    },
    body: jsonEncode({
      "topics": ["clientdata"]
    }),
  );
  print("subscribe ${subscription.statusCode}");

  final position = await http.post(
    Uri.parse(
        'http://127.0.0.1:8082/consumers/flutterconsumer/instances/my_consumer/positions/beginning'),
    headers: {
      'Content-Type': 'application/vnd.kafka.v2+json',
    },
    body: jsonEncode({
      "partitions": [
        {"topic": "clientdata", "partition": 0}
      ]
    }),
  );
  print("position ${position.statusCode}");

  final response = await http.get(
      Uri.parse(
          'http://127.0.0.1:8082/consumers/flutterconsumer/instances/my_consumer/records'),
      headers: {
        "Accept": "application/vnd.kafka.json.v2+json",
      });
  print(response.statusCode);
  print(jsonDecode(response.body));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.

    print(response.statusCode);

    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  //final String title;
  final List<Values> val;

  Album({
    //@required this.userId,
    //@required this.id,
    @required this.val,
  });

  //factory Album.fromJson(Map<String, dynamic> json) {
  factory Album.fromJson(List<dynamic> json) {
    List<Values> val = json.map((i) => Values.fromJson(i)).toList();

    return Album(val: val);
  }
}

class Values {
  Userdata userdata;
  Values({this.userdata});

  factory Values.fromJson(Map<String, dynamic> json) {
    return Values(userdata: Userdata.fromJson(json['value']));
  }
}

class Userdata {
  String name;
  String timeVal;
  int ampmindex;
  String localVal;

  Userdata({this.name, this.timeVal, this.ampmindex, this.localVal});

  factory Userdata.fromJson(Map<String, dynamic> json) {
    return Userdata(
      name: json['name'],
      timeVal: json['time'],
      ampmindex: json['ampm'],
      localVal: json['country'],
    );
  }
}
