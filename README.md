# Flutter
### Learning Flutter

**Getting Started** - https://flutter.dev/docs/get-started/install 

**Flutter for Web** - https://flutter.dev/docs/get-started/web

**Youtube Course** - https://www.youtube.com/watch?v=x0uinJvhNxI&list=PLGH08CVnDBKbC2fN_pQWrbRFIf3qq_Jdj&index=2&t=12s&ab_channel=Academind


**Hello World:**

````dart
import 'package:flutter/material.dart'; //package import

void main() //main function {
  runApp(MyApp()); //calling root class
}

class MyApp extends StatelessWidget { 
  // This widget is the root of the application.
  @override 
  //decorator . overriding the StatelessWidget's build method . For indicating  delibarete overriding not accident. 
  Widget build(BuildContext context) {
    return MaterialApp( //returning basic app structure with child 
      home: Text('Hello World!'), 
    );
  }
}

```` 

**Notes**

````dart
Column : place its children vertically
Row : place its children horizontally
[] : list annotation , can have multiple widget following commas ','

Statefulwidget : typically needs two classes. 2nd class extend State<1st Class Name>. State is maintain by SetState function.

RaisedButton : depriciated. 
now ElevatedButton : onpressed: takes only function or widget.

Container : margin : takes Edgeinsets 

const : compile time constant
final : runtime constant ( value unclear at runtime)

````

**Issues**:

Issue 1: HAXM not installing

Solution: Check if virtualization in BIOS is disabled.
https://www.intel.com/content/www/us/en/support/articles/000005486/processors.html

Issue 2 : Stuck in assembledebug

Solution: https://github.com/flutter/flutter/issues/47392 


Issue 3 : Running the app in Crome(web)
> Failed to establish connection with the > application instance in Chrome. This can happen if the websocket connection used by the web tooling is unable to correctly establish a connection, , for example due to a firewallfor example due to a firewall.

Solution : https://github.com/flutter/flutter/issues/49482#issuecomment-774642027 


Measuring App size : https://flutter.dev/docs/perf/app-size

Learning Resource from official Flutter : https://flutter.dev/docs/get-started/learn-more 
