import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

//late Future<Album> futureAlbum;
// class apicall {
//   //final data = Provider.of<MyData>(context);
//   apicall() {
//     Future<http.Response> fetchAlbum() {
//       return http
//           .get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));
//     }
//   }
// }
//print("try something");

Future<Album> fetchAlbum() async {
  final response1 =
      await http.get(Uri.parse('http://127.0.1.1:8082/topics'), headers: {
    "Accept": "application/vnd.kafka.json.v2+json",
  });

  print(response1);

  if (response1.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    print(response1.statusCode);
    // print(jsonDecode(response1.body));

    return Album.fromJson(jsonDecode(response1.body));
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

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      //userId: json['userId'],
      // id: json['id'],
      title: "son['topic']",
    );
  }

  // int getid() {
  //   return this.userId;
  // }
}
