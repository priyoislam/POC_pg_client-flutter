import 'package:flutter/material.dart';

class loginbtn extends StatelessWidget {
  //var formKey = GlobalKey<FormState>();
  //username(this.formKey);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .5,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              onPressed: () {},
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
