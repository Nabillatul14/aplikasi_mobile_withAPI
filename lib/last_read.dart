import 'package:flutter_api_bawaslu/home.dart';
import 'package:flutter/material.dart';

class last_read extends StatelessWidget {
  const last_read({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Terakhir dilihat',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        centerTitle: true,
        backgroundColor: Color(0xFFbc9d61), // warna AppBar
      ),
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
    );
  }
}
