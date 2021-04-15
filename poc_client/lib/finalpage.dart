// @dart=2.9
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// import 'package:provider/provider.dart';
// import 'package:poc_client/name.dart';
// import 'package:poc_client/data.dart';
import 'package:flutter/foundation.dart';
//import './name.dart';

class Finalpage extends StatelessWidget {
  final nameHolder;
  //String t = "hvhg";
  //Finalpage(Key key,this.nameHolder);
  Finalpage({
    Key key,
    this.nameHolder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          //Text(nameHolder),
        ],
      ),
    );
  }
}
