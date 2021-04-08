import 'package:flutter/material.dart';
import 'package:poc_client/finalpage.dart';
import 'package:poc_client/name.dart';
import 'package:poc_client/time.dart';
import 'package:poc_client/locale.dart';

import 'package:poc_client/main.dart';

class loginbtn extends StatelessWidget {
  //var formKey = GlobalKey<FormState>();
  //username(this.formKey);
  String s = 'mul';
  final username un;
  loginbtn(this.un);
  /*getItemAndNavigate(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => finalpage(
                  //nameHolder: userState().myController.text.toString(),
                  nameHolder: s,
                  // classHolder : studentClass.text,
                  // numberHolder : phoneNumber.text
                  //nameHolder: localeState().dropdownValue,
                )));
  }*/

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {
                print(s);
                //s = this.un.myCon
                //finalpage(un);
                print("sdsdff");
                print(s);
                // userState().pr();
                //userState().setText();
                //userState().usernamereturn();
                //getItemAndNavigate(context);
              },
              child: Text('Log In'),
              style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  textStyle:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
          ),
        ],
      ),
    );
  }
}
