import 'package:facebook_clone/config/palette.dart';
import 'package:flutter/material.dart';

import 'screens/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
      debugShowCheckedModeBanner: false,
      home: NavScreen(),
    );
  }
}
