import 'package:flutter/material.dart';
import 'package:toggle_switch/toggle_switch.dart';
import './secondscreen.dart';
//import 'kafka.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: Text('POC PG Client Simple')),
            body: Center(child: HomeScreen())));
  }
}

class HomeScreen extends StatefulWidget {
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final name = TextEditingController();
  //TextEditingController name;
  String timeValue;
  int ampm = 0;
  String dropdownValue2;

  getItemAndNavigate(BuildContext context) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => SecondScreen(
                  nameHolder: name.text,
                  timeHolder: timeValue,
                  ampmHolder: ampm,
                  localeHolder: dropdownValue2,
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width * .5,
            margin: EdgeInsets.all(5.0),
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter Your Name',
              ),
              controller: name,
            ),
          ),
          Container(
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
                    value: timeValue,
                    isExpanded: true,
                    hint: Text('Enter Time'),
                    onChanged: (String newValue) {
                      setState(() {
                        timeValue = newValue;
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
                    initialLabelIndex: ampm,
                    labels: ['AM', 'PM'],
                    onToggle: (index) {
                      ampm = index;

                      // time(dropdownValue, initialIndex);
                    },
                  ),
                ),
              ],
            ),
          ),
          Container(
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
                    value: dropdownValue2,
                    isExpanded: true,
                    hint: Text('Enter Location'),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue2 = newValue;
                      });
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
          ),
          ElevatedButton(
            onPressed: () {
              //kaf();
              getItemAndNavigate(context);
            },
            style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                textStyle:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            // color: Color(0xffFF1744),
            // textColor: Colors.white,
            // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('Log in'),
          ),
        ],
      ),
    ));
  }
}
