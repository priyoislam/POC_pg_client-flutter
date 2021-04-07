import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import './finalpage.dart';

class timevalue extends StatefulWidget {
  const timevalue({Key? key}) : super(key: key);

  @override
  _timeState createState() => _timeState();
}

class _timeState extends State<timevalue> {
  String? dropdownValue;
  int initialIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.0),
      // padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width * .5,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.tight,
            child: DropdownButton<String>(
              value: dropdownValue,
              isExpanded: true,
              hint: Text('Enter Time'),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownValue = newValue!;
                });
              },
              items: <String>[
                '01.00',
                '02.00',
                '03.00',
                '04.00',
                '05.00',
                '06.00',
                '07.00',
                '08.00',
                '09.00',
                '10.00',
                '11.00',
                '12.00',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          Spacer(),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: ToggleSwitch(
              minWidth: 50.0,
              minHeight: 30.0,
              cornerRadius: 20.0,
              initialLabelIndex: initialIndex,
              labels: ['AM', 'PM'],
              onToggle: (index) {
                setState(() {
                  initialIndex = index;
                });
                // time(dropdownValue, initialIndex);
              },
            ),
          ),
        ],
      ),
    );
  }
}
