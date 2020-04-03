import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Center(
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Container(
                  // height: 100,
                  // width: 100,
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Text('Hello'),
                ),
                Container(
                  // height: 100,
                  // width: 100,
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  color: Colors.blue,
                  child: Text('Hello'),
                ),
                Container(
                  // height: 100,
                  // width: 100,
                  // margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(10),
                  color: Colors.orange,
                  child: Text('Hello'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
