import 'package:flutter_api_bawaslu/about.dart';
import 'package:flutter_api_bawaslu/pemilihan.dart';
import 'package:flutter_api_bawaslu/pemilu.dart';
import 'package:flutter_api_bawaslu/splashscreen.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Container(
        color: Color.fromRGBO(255, 255, 255, 1),
        child: Column(
          children: [
            Container(
              height: 15,
              width: 5,
            ),
            
            //image logo bawaslu
            Container(
              child: Center(
              child: Image.asset('images/LOGOBAWASLU.png'),
              ),
              height: 180,
              width: 300,
              ),

            //image epasal
            Container(
              child: Center(
                child: Image.asset('images/epasalwhite.jpg'),  
              ),
            ),
            // Container(
            //   height: 4,
            //   width: 2,
            // ),
            
            //button 1
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 5,
                    width: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pemilu()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFbc9d61)// Mengatur warna latar belakang menjadi putih
                    ),
                    icon: Image.asset(
                      'images/law.png',
                      height: 30,
                      width: 30,
                    ),
                    label: Text('      Pemilu      ', style: TextStyle(color: Colors.black)), // Mengatur warna teks tombol menjadi hitam
                  ),
                ],
              ),
            ),


            //button 2
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 5,
                    width: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => pemilihan()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFbc9d61) // Mengatur warna latar belakang menjadi putih
                    ),
                    icon: Image.asset(
                      'images/law.png',
                      height: 30,
                      width: 30,
                    ),
                    label: Text('    Pemilihan    ', style: TextStyle(color: Colors.black)), // Mengatur warna teks tombol menjadi hitam
                  ),
                ],
              ),
            ),


            //button 3
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 5,
                    width: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => about()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFbc9d61) // Mengatur warna latar belakang menjadi putih
                    ),
                    icon: Image.asset(
                      'images/law.png',
                      height: 30,
                      width: 30,
                    ),
                    label: Text(' Tentang Kami ', style: TextStyle(color: Colors.black)), // Mengatur warna teks tombol menjadi hitam
                  ),
                ],
              ),
            ),


          ],
        ),
      ),
    );
  }
}