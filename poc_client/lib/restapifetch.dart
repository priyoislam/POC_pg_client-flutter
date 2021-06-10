import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:async';

Future<Album> fetchAlbum() async {
  //print("try something");

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
        // "access.control.allow.origin": "*",
        // "access.control.allow.methods": "GET,POST,PUT,DELETE,OPTIONS,HEAD"
      });
  print(response.statusCode);
  print(jsonDecode(response.body));
  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var data = json.decode(response.body);
    // var rest = data["feed"]["entry"] as List;
    print(response.statusCode);

    return Album.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

class Album {
  //final int userId;
  //final int id;
  final String title;

  Album({
    //@required this.userId,
    //@required this.id,
    @required this.title,
  });

  //factory Album.fromJson(Map<String, dynamic> json) {
  factory Album.fromJson(List<dynamic> json) {
    return Album(
        //userId: json['userId'],
        // id: json['id'],
        title: 'sda');
  }
}
