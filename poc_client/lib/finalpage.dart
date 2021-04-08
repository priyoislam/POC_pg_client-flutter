import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:poc_client/name.dart';

//import './name.dart';

class finalpage extends StatelessWidget {
  final username nameHolder;
  //finalpage(this.nameHolder);
  // finalpage({
  //   Key? key,
  //   @required this.nameHolder,
  // }) : super(key: key);
  final(this.nameHolder);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          //Text(nameHolder),
          Text(nameHolder),
          //Text("sdhvghd"),
        ],
      ),
    );
  }
}
