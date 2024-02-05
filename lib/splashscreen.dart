import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/home.dart';

class halamanawal extends StatefulWidget {
  const halamanawal({super.key});

  @override
  State<halamanawal> createState() => _halamanawalState();
}

class _halamanawalState extends State<halamanawal> {

  void initState(){
    super.initState();
    halamanawalstart();
  }

  halamanawalstart() async{
    var duration = const Duration(seconds:3);
    return Timer(duration, (){
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => home(),));
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          children: [
            Container(
              height: 60,
              width: 30,
            ),
        
            Container(
              height: 80,
            ),
            //image logo bawaslu
            Container(
              child: Center(
                child: Image.asset('images/LOGOBAWASLU.png'),
              ),
              height: 100,
              width: 200,
            ),
            
            Container(
              child: Center(
                child: Image.asset('images/epasalwhite.jpg'),  
              ),
            ),
            Container(
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}