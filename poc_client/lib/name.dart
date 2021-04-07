import 'package:flutter/material.dart';
import './finalpage.dart';

class username extends StatefulWidget {
  @override
  _userState createState() => _userState();
}

class _userState extends State<username> {
  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  String usernamereturn() {
    return myController.text;
  }

  //var un= Text(myController.text.toString());
  //finalpage.userName(myController.text.toString());
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      margin: EdgeInsets.all(5.0),
      child: SizedBox(
        //width: 400,
        child: TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Enter Your Name',
          ),
          controller: myController,

          onChanged: (text) {
            name(text);
          },
          // The validator receives the text that the user has entered.
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter valid name';
            }
            return null;
          },
        ),
      ),
    );
  }
}
