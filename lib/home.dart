import 'package:flutter/foundation.dart';
import 'package:flutter_api_bawaslu/about.dart';
import 'package:flutter_api_bawaslu/bookmark.dart';
import 'package:flutter_api_bawaslu/last_read.dart';
import 'package:flutter_api_bawaslu/pemilihan.dart';
import 'package:flutter_api_bawaslu/pemilu.dart';
import 'package:flutter_api_bawaslu/profil.dart';
import 'package:flutter_api_bawaslu/tentang_aplikasi.dart';
import 'package:flutter_api_bawaslu/splashscreen.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFbc9d61),
        // centerTitle: true,
        // title: const
        // Text(
        //   '',
        //   style: TextStyle(
        //       fontFamily: 'Poppins',
        //       fontSize: 20,
        //       fontWeight: FontWeight.bold,
        //       color: Color.fromARGB(255, 0, 0, 0),
        //       letterSpacing: 0.53),
        // ),
        // shape: const RoundedRectangleBorder(
        //   borderRadius: BorderRadius.vertical(
        //     bottom: Radius.circular(30),
        //   ),
        // ),

        iconTheme: IconThemeData(
          color: Colors.black,
        ), // Ubah warna ikon menu menjadi hitam

        // bottom: PreferredSize(
        //     child: Container(
        //       padding: const EdgeInsets.only(left: 30, right: 20, bottom: 5),
        //       //image logo bawaslu
        //       child: Center(
        //       child: Image.asset('images/LOGOBAWASLU.png'),
        //       ),
        //       height: 90,
        //       width: 300,
        //     ),
        //     preferredSize: const Size.fromHeight(110)),
      ),
      drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          child: ListView(
            children: [
              DrawerHeader(
                margin: EdgeInsets.zero,
                padding: EdgeInsets.zero,
                decoration: BoxDecoration(
                  color: Color.fromARGB(
                      255, 255, 255, 255), // Warna latar belakang DrawerHeader
                ),
                child: UserAccountsDrawerHeader(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 255, 255,
                          255) // Ubah warna latar belakang menjadi putih
                      ),
                  accountName: SizedBox.shrink(), // Menghapus accountName
                  accountEmail: SizedBox.shrink(), // Menghapus accountEmail
                  currentAccountPicture: Stack(
                    alignment:
                        Alignment.bottomLeft, // Atur letak gambar di sini
                    children: [
                      CircleAvatar(
                        radius: 300,
                        backgroundImage: AssetImage('images/robot.jpg'),
                      ),
                      Container(
                        margin: const EdgeInsets.only(bottom: 800),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.person,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(
                  "Tentang Saya",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MyProfile(),
                      ));
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.home,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
                title: Text(
                  "Tentang Aplikasi",
                  style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                ),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ttg_apk(),
                      ));
                },
              ),
            ],
          )),
      body: Container(
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
              height: 200,
              width: 300,
            ),

            //Terakhir dilihat
            SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Color.fromRGBO(193, 159, 92, 1),
                    Color.fromARGB(121, 210, 148, 73),
                  ],
                ),
              ),
              child: Material(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(20),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => last_read()),
                    );
                  },
                  child: Container(
                    padding:
                        const EdgeInsets.only(left: 20, right: 10, bottom: 10),
                    height: 150,
                    width: 300,
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.menu_book_rounded,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                                SizedBox(width: 10, height: 60),
                                Text(
                                  "Terakhir dibaca",
                                  style: TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(width: 10, height: 20),
                            Text(
                              "Pasal 1",
                              style: TextStyle(
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          bottom: -40,
                          right: 0,
                          child: Container(
                            width: 150,
                            height: 200,
                            child: Image.asset('images/robote.png',
                                fit: BoxFit.contain),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 60,
              width: 200,
            ),

            // //button 1
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Container(
            //         height: 1,
            //         width: 30,
            //       ),
            //       ElevatedButton.icon(
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(builder: (context) => pemilu()),
            //             );
            //           },
            //           style: ElevatedButton.styleFrom(
            //               backgroundColor: Color(
            //                   0xFFbc9d61) // Mengatur warna latar belakang menjadi putih
            //               ),
            //           icon: Image.asset(
            //             'images/law.png',
            //             height: 30,
            //             width: 30,
            //           ),
            //           label: Text('       Pemilu       ',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 20,
            //               ))),
            //     ],
            //   ),
            // ),

            // //button 2
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Container(
            //         height: 60,
            //         width: 30,
            //       ),
            //       ElevatedButton.icon(
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(builder: (context) => pemilihan()),
            //             );
            //           },
            //           style: ElevatedButton.styleFrom(
            //               backgroundColor: Color(
            //                   0xFFbc9d61) // Mengatur warna latar belakang menjadi putih
            //               ),
            //           icon: Image.asset(
            //             'images/law.png',
            //             height: 30,
            //             width: 30,
            //           ),
            //           label: Text('     Pemilihan    ',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 20,
            //               ))),
            //     ],
            //   ),
            // ),

            // //button 3
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Container(
            //         height: 60,
            //         width: 30,
            //       ),
            //       ElevatedButton.icon(
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(builder: (context) => about()),
            //             );
            //           },
            //           style: ElevatedButton.styleFrom(
            //               backgroundColor: Color.fromRGBO(188, 157, 97,
            //                   1) // Mengatur warna latar belakang menjadi putih
            //               ),
            //           icon: Image.asset(
            //             'images/law.png',
            //             height: 30,
            //             width: 30,
            //           ),
            //           label: Text(' Tentang Kami ',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 20,
            //               ))),
            //     ],
            //   ),
            // ),

            // //button 4
            // Center(
            //   child: Column(
            //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //     children: [
            //       Container(
            //         height: 60,
            //         width: 30,
            //       ),
            //       ElevatedButton.icon(
            //           onPressed: () {
            //             Navigator.push(
            //               context,
            //               MaterialPageRoute(builder: (context) => bookmark()),
            //             );
            //           },
            //           style: ElevatedButton.styleFrom(
            //               backgroundColor: Color(
            //                   0xFFbc9d61) // Mengatur warna latar belakang menjadi putih
            //               ),
            //           icon: Image.asset(
            //             'images/law.png',
            //             height: 30,
            //             width: 30,
            //           ),
            //           label: Text('     Bookmark    ',
            //               style: TextStyle(
            //                 color: Colors.white,
            //                 fontWeight: FontWeight.bold,
            //                 fontSize: 20,
            //               ))),
            //     ],
            //   ),
            // ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Button 1 (kiri atas)
                    SizedBox(
                      width: 130, // Ubah lebar tombol sesuai kebutuhan
                      height: 100, // Ubah tinggi tombol sesuai kebutuhan
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => pemilu()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFbc9d61),
                        ),
                        icon: Column(
                          children: [
                            Image.asset(
                              'images/law.png',
                              height: 60,
                              width: 30,
                            ),
                            SizedBox(height: 2), // Jarak antara ikon dan teks
                            Text(
                              'Pemilu',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        label: Text(''), // Kosongkan label agar tidak muncul
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                    ),

                    // Button 2 (kanan atas)
                    SizedBox(
                      width: 130, // Ubah lebar tombol sesuai kebutuhan
                      height: 100, // Ubah tinggi tombol sesuai kebutuhan
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => pemilihan(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFbc9d61),
                        ),
                        icon: Column(
                          children: [
                            Image.asset(
                              'images/law.png',
                              height: 60,
                              width: 30,
                            ),
                            SizedBox(height: 2), // Jarak antara ikon dan teks
                            Text(
                              'Pemilihan',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        label: Text(''), // Kosongkan label agar tidak muncul
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50), // Jarak antara baris tombol

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Button 3 (kiri bawah)
                    SizedBox(
                      width: 130, // Ubah lebar tombol sesuai kebutuhan
                      height: 100, // Ubah tinggi tombol sesuai kebutuhan
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => about(),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(188, 157, 97, 1),
                        ),
                        icon: Column(
                          children: [
                            Image.asset(
                              'images/law.png',
                              height: 60,
                              width: 30,
                            ),
                            SizedBox(height: 2), // Jarak antara ikon dan teks
                            Text(
                              'BAWASLU',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        label: Text(''), // Kosongkan label agar tidak muncul
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                    ),

                    // Button 4 (kanan bawah)
                    SizedBox(
                      width: 130, // Ubah lebar tombol sesuai kebutuhan
                      height: 100, // Ubah tinggi tombol sesuai kebutuhan
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookmarkScreen(), // <-- Panggilan yang benar
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          primary: Color(0xFFbc9d61),
                        ),
                        icon: Column(
                          children: [
                            Image.asset(
                              'images/law.png',
                              height: 60,
                              width: 30,
                            ),
                            SizedBox(height: 2), // Jarak antara ikon dan teks
                            Text(
                              'Bookmark',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        label: Text(''), // Kosongkan label agar tidak muncul
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
