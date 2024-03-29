import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import 'package:provider/provider.dart';
import 'package:poc_client/data.dart';

class TimeValue extends StatelessWidget {
  // String? timeVal;
  //int ampmIndex = 0;

  @override
  Widget build(BuildContext context) {
    final data = Provider.of<MyData>(context);
    return Container(
      margin: EdgeInsets.all(5.0),
      // padding: EdgeInsets.symmetric(horizontal: 10.0),
      width: MediaQuery.of(context).size.width * .7,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: DropdownButton<String>(
              value: data.timeVal,
              isExpanded: true,
              hint: Text('Enter Time'),
              onChanged: (String newValue) {
                data.timeVal = newValue;
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
              minWidth: 30.0,
              minHeight: 30.0,
              cornerRadius: 20.0,
              initialLabelIndex: data.ampm,
              labels: ['AM', 'PM'],
              onToggle: (index) {
                data.ampm = index;

                // time(dropdownValue, initialIndex);
              },
            ),
          ),
        ],
      ),
    );
  }
}
