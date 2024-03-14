import 'package:flutter_api_bawaslu/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/splashscreen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();

  var box = await Hive.openBox('Favourite');
  
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
