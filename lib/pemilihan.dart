// import 'package:flutter_api_bawaslu/pemilu/perbawaslu.dart';
// import 'package:flutter_api_bawaslu/pemilu/uupemilu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihanKeputusan.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihanuud.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihanperbawaslu.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilukeputusan.dart';
import 'package:flutter_api_bawaslu/views/searchpemilihankeputusan.dart';
import 'package:flutter_api_bawaslu/views/searchpemilihanperbawaslu.dart';

class pemilihan extends StatelessWidget {
  const pemilihan ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pemilihan',  
        style: TextStyle(color: Colors.white, 
        fontWeight: FontWeight.bold,
        fontSize: 25)), 
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
                  height: 50,
                  width: 30,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => PdfViewPemilihanUUD()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFbc9d61), // Memberikan warna latar belakang  tombol
                  ),
                  icon: Image.asset(
                    'images/law.png',
                    height: 30,
                    width: 30,
                  ),
                  label: Text('Undang-Undang Pemilihan', 
                  style: TextStyle(color: Colors.white, 
                  fontWeight: FontWeight.bold,
                  fontSize: 20,)) // Mengatur warna teks tombol menjadi putih),
                ),
              ],
            ),

            //button 2
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        // MaterialPageRoute(builder: (context) => PdfViewPemilihanPerbawaslu()),
                        MaterialPageRoute(builder: (context) => HomeScreenperbawaslu()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFbc9d61), // Memberikan warna latar belakang tombol
                    ),
                    icon: Image.asset(
                      'images/law.png',
                      height: 30,
                      width: 30,
                    ),
                    label: Text('           PERBAWASLU           ', 
                    style: TextStyle(color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    fontSize: 20,)) 
                  ),
                ],
              ),

              //button 3
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 50,
                    width: 30,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        // MaterialPageRoute(builder: (context) => PdfViewPemilihanKeputusan()),
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFFbc9d61), // Memberikan warna latar belakang tombol
                    ),
                    icon: Image.asset(
                      'images/law.png',
                      height: 30,
                      width: 30,
                    ),
                    label: Text('     Keputusan BAWASLU    ', 
                   style: TextStyle(color: Colors.white, 
                    fontWeight: FontWeight.bold,
                    fontSize: 20,)) 
                  ),
                ],
              ),
          ]
        ),
      ),],),
    );
  }
}