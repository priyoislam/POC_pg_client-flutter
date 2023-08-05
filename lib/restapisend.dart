import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:poc_client/eventbus.dart';

import 'dart:async';
import 'package:poc_client/data.dart';

class Kafkadata {
  static String name;
  static String timeVal; //= "01.00";
  static int ampmindex;
  static String localVal;

  /// String get name => _name;

  Kafkadata() {
    hub.on<MyData>().listen((event) {
      name = event.name;
      timeVal = event.timeVal;
      ampmindex = event.ampm;
      localVal = event.localVal;
    });
  }
}

Future<void> senddata() async {
  print("datam " + Kafkadata.name);

  final response = await http.post(
    Uri.parse('http://127.0.0.1:8082/topics/clientdata'),
    headers: <String, String>{
      'Content-Type': 'application/vnd.kafka.json.v2+json',
    },
    body: jsonEncode({
      "records": [
        {
          "value": {
            "name": Kafkadata.name,
            "time": Kafkadata.timeVal,
            "ampm": Kafkadata.ampmindex,
            "country": Kafkadata.localVal,
          }
        }
      ]
    }),
  );

  print(response.body);

  if (response.statusCode == 200) {
    // If the server did return a 201 CREATED response,
    // then parse the JSON.

    print("Send ok : ${response.statusCode}");
  } else {
    // If the server did not return a 201 CREATED response,
    // then throw an exception.
    throw Exception('Failed to create album.');
  }
}
