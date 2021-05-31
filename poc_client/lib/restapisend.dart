import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

// import 'dart:async';
Future<Album2> createAlbum(final title) async {
  final response = await http.post(
    Uri.parse('http://rest-proxy:8082/topics/userlog'),
    headers: <String, String>{
      'Content-Type': 'application/vnd.kafka.json.v2+json',
      //"Access-Control-Allow-Origin": "*",
      //"Access-Control-Allow-Methods": "POST, OPTIONS,GET, HEAD",
      //"Access-Control-Allow-Credentials": "true",
      // "Access-Control-Allow-Headers":
      //"Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With, Access-Control-Allow-Origin"
    },
    body: jsonEncode({
      "records": [
        {
          "value": {
            "name": "dart",
            "time": "11:00",
            "ampm": "1",
            "country": "USA"
          }
        }
      ]
    }),
  );

  if (response.statusCode == 201) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.
    print(response.body);
    return Album2.fromJson(jsonDecode(response.body));
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}

class Album2 {
  //final int id;
  final String id;
  //final String title;

  //Album2({@required this.id, @required this.title});
  Album2({@required this.id});

  factory Album2.fromJson(Map<String, dynamic> json) {
    return Album2(
      id: json['key_schema_id'],
      //title: json['title'],
    );
  }
}
