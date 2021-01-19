import 'package:flutter/material.dart';
import 'package:flutter_facebook_ui/config/palette.dart';
import 'package:flutter_facebook_ui/screen/home_screen.dart';
import 'package:flutter_facebook_ui/screen/nav_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Facebook Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Palette.scaffold,
      ),
      home: NavScreen(),
    );
  }
}
