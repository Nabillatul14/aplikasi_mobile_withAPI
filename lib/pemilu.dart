// import 'package:flutter_api_bawaslu/pemilu/perbawaslu.dart';
// import 'package:flutter_api_bawaslu/pemilu/uupemilu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemiluperbawaslu.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemiluuud.dart';

class pemilu extends StatelessWidget {
  const pemilu ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemilu'),
        centerTitle: true,
        backgroundColor: Color(0xFFbc9d61), // warna AppBar
      ),
        backgroundColor: Color.fromRGBO(255, 255, 255, 1),

        body: Stack(
        children: [
          // Gambar latar belakang
          Positioned.fill(
            child: Image.asset(
              'images/epasalwhite.jpg',
              fit: BoxFit.cover,
              color: Color.fromRGBO(255, 255, 255, 0.3), // Memberikan efek transparansi pada gambar latar belakang 
              colorBlendMode: BlendMode.modulate,
            ),
          ),
      Container(
        alignment: Alignment.center,
        child: Column(
          children: [

            //button 1
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 30,
                  width: 30,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const PdfViewPemiluUUD()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFbc9d61), // Memberikan warna latar belakang pada tombol
                  ),
                  icon: Image.asset(
                    'images/law.png',
                    height: 30,
                    width: 30,
                  ),
                  label: Text('Undang-Undang Pemilu'),
                ),
              ],
            ),

            //button 2
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PdfViewPemiluPerbawaslu()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFbc9d61), // Memberikan warna latar belakang pada tombol
                    ),
                    icon: Image.asset(
                      'images/law.png',
                      height: 30,
                      width: 30,
                    ),
                    label: Text('        PERBAWASLU        ', style: TextStyle(color: Colors.white)), // Mengatur warna teks tombol menjadi putih
                  ),
                ],
              ),
          ]
        ),
      ),],),
    );
  }
}