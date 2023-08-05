import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:poc_client/data.dart';

class UserName extends StatelessWidget {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MyData>(context);
    //String val;
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      margin: EdgeInsets.all(5.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter Your Name',
        ),
        controller: myController,
        onChanged: (value) {
          data.name = value;
          //print(data.name);
        },
      ),
    );
  }
}
