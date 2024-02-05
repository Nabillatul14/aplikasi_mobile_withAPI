import 'package:flutter_api_bawaslu/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/splashscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFbc9d61), 
      ),
      home: const halamanawal(),
    );
  }
}
