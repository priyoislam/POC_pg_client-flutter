import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:poc_client/data.dart';

class LocalValue extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MyData>(context);
    return Container(
      margin: EdgeInsets.all(5.0),
      padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width * .5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,

        //: Border.all(width: 2.0, color: const Color(0xFFFFFFFF))
        children: [
          Flexible(
            child: DropdownButton<String>(
              value: data.localVal,
              isExpanded: true,
              hint: Text('Enter Location'),
              onChanged: (String? newValue) {
                data.localVal = newValue!;

                // location(dropdownValue);
              },
              items: <String>[
                'Bangladesh',
                'USA',
                'India',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

/// This is the stateful widget that the main application instantiates.
// class locale extends StatefulWidget {
//   const locale({Key? key}) : super(key: key);

//   @override
//   localeState createState() => localeState();
// }

// /// This is the private State class that goes with MyStatefulWidget.
// class localeState extends State<locale> {
//   String? dropdownValue;
//   int initialIndex = 0;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.all(5.0),
//       padding: EdgeInsets.symmetric(horizontal: 10.0),
//       width: MediaQuery.of(context).size.width * .5,
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.black38),
//         borderRadius: BorderRadius.circular(5.0),
//       ),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.start,

//         //: Border.all(width: 2.0, color: const Color(0xFFFFFFFF))
//         children: [
//           Flexible(
//             child: DropdownButton<String>(
//               value: dropdownValue,
//               isExpanded: true,
//               hint: Text('Enter Location'),
//               onChanged: (String? newValue) {
//                 setState(() {
//                   dropdownValue = newValue!;
//                 });
//                 // location(dropdownValue);
//               },
//               items: <String>[
//                 'Bangladesh',
//                 'USA',
//                 'India',
//               ].map<DropdownMenuItem<String>>((String value) {
//                 return DropdownMenuItem<String>(
//                   value: value,
//                   child: Text(value),
//                 );
//               }).toList(),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
