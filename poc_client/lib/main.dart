// @dart=2.9
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:poc_client/data.dart';
import 'package:poc_client/thirdscreen.dart';
import 'package:poc_client/name.dart';
import 'package:poc_client/time.dart';
import 'package:poc_client/locale.dart';
import 'package:poc_client/login.dart';
import 'package:provider/provider.dart';
import 'package:event_bus/event_bus.dart';
import 'package:poc_client/env.dart';
import 'package:http/http.dart';
import 'package:poc_client/restapifetch.dart';
import 'package:poc_client/restapisend.dart';

void main() => runApp(MyApp());
EventBus eventBus = EventBus();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Client App Simple Demo';

    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: Text(appTitle),
        ),
        body: MyCustomForm(),
      ),
    );
  }
}

// Create a Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  MyCustomFormState createState() {
    return MyCustomFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class MyCustomFormState extends State<MyCustomForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return ChangeNotifierProvider(
//       create: (context) => MyData(),
//       child: Form(
//         key: _formKey,
//         child: Center(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             mainAxisAlignment: MainAxisAlignment.center,
//             // margin: new EdgeInsets.all(8.0),
//             children: <Widget>[
//               UserName(),
//               TimeValue(),
//               LocalValue(),
//               Loginbtn(),

//               //Loginbtn(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

  @override
  Widget build(BuildContext context) {
    return ThirdScreen();
  }
}
