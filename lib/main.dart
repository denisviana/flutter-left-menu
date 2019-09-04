import 'package:flutter/material.dart';

import 'menu.dart';
import 'menu1.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuScreen(title: 'Flutter Demo Home Page'),
    );
  }
}
