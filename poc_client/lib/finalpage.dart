import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

//import './name.dart';

class finalpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        // child: Column(
        //   children: <Widget>[
        //     // name(),
        //   ],
        // ),
        );
  }
}

class name extends StatelessWidget {
  final String x;
  name(this.x);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(x),
    );
  }
}

class location extends StatelessWidget {
  final String x;
  location(this.x);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(x),
    );
  }
}

class time extends StatelessWidget {
  final String? x;
  final int y;
  time(this.x, this.y);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Row(
      children: <Widget>[
        Text(x ?? " "),
        Text(y == 0 ? 'AM' : 'PM'),
      ],
    ));
  }
}
