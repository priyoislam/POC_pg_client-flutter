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

// class username extends StatefulWidget {
//   @override
//   userState createState() => userState();
// }

// class userState extends State<username> {
//   final myController = TextEditingController();
//   // @override
//   //     void initState() {
//   //       super.initState();
//   //       myController = TextEditingController();
//   //     }
//   String t = "0";
//   String text = "No Value Entered";

//   /*void setText() {
//     setState(() {
//       text = t;
//     });
//   }*/
//   /*void pr() {
//     print(userState().myController.text);
//   }*/

//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
// return Container(
//   width: MediaQuery.of(context).size.width * .5,
//   margin: EdgeInsets.all(5.0),
//   child: TextFormField(
//       decoration: InputDecoration(
//         border: OutlineInputBorder(),
//         hintText: 'Enter Your Name',
//       ),
//       controller: myController,
//       onChanged: (value) {
//         setState(() {
//           //text = value;
//         });
//       }),
// );
//   }
// }
