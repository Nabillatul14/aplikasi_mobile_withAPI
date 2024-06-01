//yg bisa pertama


// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihanuud.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihanperbawaslu.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilukeputusan.dart';
// import 'package:flutter_api_bawaslu/views/searchpemilihankeputusan.dart';
// import 'package:flutter_api_bawaslu/views/searchpemilihanperbawaslu.dart';
// import 'package:flutter_api_bawaslu/views/searchpemilihanuud.dart';

// class pemilihan extends StatelessWidget {
//   const pemilihan ({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Pemilihan',
//         style: TextStyle(color: Colors.white,
//         fontWeight: FontWeight.bold,
//         fontSize: 25)),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61), // warna AppBar
//       ),
//         backgroundColor: Color.fromRGBO(255, 255, 255, 1),
//         body: Stack(
//         children: [
//           // Gambar latar belakang
//           Positioned.fill(
//             child: Image.asset(
//               'images/epasalwhite.jpg',
//               fit: BoxFit.cover,
//               color: Color.fromRGBO(255, 255, 255, 0.3), // Memberikan efek transparansi pada gambar latar belakang
//               colorBlendMode: BlendMode.modulate,
//             ),
//           ),
//       Container(
//         alignment: Alignment.center,
//         child: Column(
//           children: [

//             //button 1
//              Column(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 Container(
//                   height: 50,
//                   width: 30,
//                 ),
//                 ElevatedButton.icon(
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => pemilihanuud()),
//                     );
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFFbc9d61), // Memberikan warna latar belakang  tombol
//                   ),
//                   icon: Image.asset(
//                     'images/law.png',
//                     height: 30,
//                     width: 30,
//                   ),
//                   label: Text('Undang-Undang Pemilihan',
//                   style: TextStyle(color: Colors.white,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 20,)) // Mengatur warna teks tombol menjadi putih),
//                 ),
//               ],
//             ),

//             //button 2
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     height: 50,
//                     width: 30,
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         // MaterialPageRoute(builder: (context) => PdfViewPemilihanPerbawaslu()),
//                         MaterialPageRoute(builder: (context) => pemilihanperbawaslu()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFFbc9d61), // Memberikan warna latar belakang tombol
//                     ),
//                     icon: Image.asset(
//                       'images/law.png',
//                       height: 30,
//                       width: 30,
//                     ),
//                     label: Text('           PERBAWASLU           ',
//                     style: TextStyle(color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,))
//                   ),
//                 ],
//               ),

//               //button 3
//               Column(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   Container(
//                     height: 50,
//                     width: 30,
//                   ),
//                   ElevatedButton.icon(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (context) => pemilihankeputusan()),
//                       );
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Color(0xFFbc9d61), // Memberikan warna latar belakang tombol
//                     ),
//                     icon: Image.asset(
//                       'images/law.png',
//                       height: 30,
//                       width: 30,
//                     ),
//                     label: Text('     Keputusan BAWASLU    ',
//                    style: TextStyle(color: Colors.white,
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,))
//                   ),
//                 ],
//               ),
//           ]
//         ),
//       ),],),
//     );
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/models/post.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihanuud.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihanperbawaslu.dart';
// import 'package:flutter_api_bawaslu/views/searchpemilihankeputusan.dart';
// import 'package:flutter_api_bawaslu/views/searchpemilihanperbawaslu.dart';
// import 'package:flutter_api_bawaslu/views/searchpemilihanuud.dart';
// import 'package:http/http.dart' as http;
// import 'package:hive/hive.dart';

// class pemilihan extends StatefulWidget {
//   const pemilihan({Key? key}) : super(key: key);

//   @override
//   _pemilihanState createState() => _pemilihanState();
// }

// class _pemilihanState extends State<pemilihan> {
//   late Box _myBox;
//   List<int> readPDFIds = [];
//   int? selectedPDFId;
//   List<Post> posts = [];
//   late List<Post> displayItem = List.from(posts);
//   TextEditingController searchDatauser = TextEditingController();
//   bool isSearching = false;

//   @override
//   void initState() {
//     super.initState();
//     openHiveBoxes();
//     fetchPost();
//   }

//   void openHiveBoxes() async {
//     await Hive.openBox('Favourite');
//     _myBox = Hive.box('Favourite');
//   }

//   void addToBookmark(int id) {
//     var bookmarkData = _myBox.get('bookmark') ?? [];
//     if (!bookmarkData.contains(id)) {
//       bookmarkData.add(id);
//       _myBox.put('bookmark', bookmarkData);
//       print('Item berhasil ditambahkan ke bookmark');
//     } else {
//       print('Item sudah ada di dalam bookmark');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Pemilihan',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25)),
//         centerTitle: true,
//         backgroundColor: const Color(0xFFbc9d61),
//         actions: [
//           IconButton(
//             icon: Icon(Icons.search),
//             onPressed: () {
//               setState(() {
//                 isSearching = true;
//               });
//             },
//           ),
//         ],
//       ),
//       backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
//       body: isSearching ? _buildSearchBody() : _buildButtonList(),
//     );
//   }

//   Widget _buildButtonList() {
//     return Container(
//       alignment: Alignment.center,
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ElevatedButton.icon(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       pemilihanuud(), // Ganti dengan widget yang sesuai
//                 ),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFFbc9d61),
//             ),
//             icon: Image.asset(
//               'images/law.png',
//               height: 30,
//               width: 30,
//             ),
//             label: Text(
//               'Undang-Undang Pemilihan',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       pemilihanperbawaslu(), // Ganti dengan widget yang sesuai
//                 ),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFFbc9d61),
//             ),
//             icon: Image.asset(
//               'images/law.png',
//               height: 30,
//               width: 30,
//             ),
//             label: Text(
//               'PERBAWASLU',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//           SizedBox(height: 10),
//           ElevatedButton.icon(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       pemilihankeputusan(), // Ganti dengan widget yang sesuai
//                 ),
//               );
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: Color(0xFFbc9d61),
//             ),
//             icon: Image.asset(
//               'images/law.png',
//               height: 30,
//               width: 30,
//             ),
//             label: Text(
//               'Keputusan BAWASLU',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 20,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildSearchBody() {
//     return ListView(
//       children: [
//         Container(
//           height: 100,
//           width: MediaQuery.of(context).size.width,
//           margin: const EdgeInsets.all(20.0),
//           child: TextField(
//             controller: searchDatauser,
//             onChanged: ((value) => searchData(value)),
//             decoration: InputDecoration(
//               filled: true,
//               border: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(20.0),
//               ),
//               hintText: 'Cari undang-undang / pasal di sini',
//               prefixIcon: const Icon(Icons.search),
//             ),
//           ),
//         ),
//         Container(
//           padding: const EdgeInsets.all(20.0),
//           child: (searchDatauser.text == '')
//               ? SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   child: ListView.builder(
//                     itemCount: displayItem.length,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () {
//                           markPDFAsRead(displayItem[index].id);

//                           setState(() {
//                             selectedPDFId = displayItem[index].id;
//                           });
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Viewer(
//                                 url: displayItem[index].firebase_url,
//                               ),
//                             ),
//                           ).then((_) {
//                             setState(() {
//                               selectedPDFId =
//                                   null; // Reset selectedPDFId setelah kembali dari tampilan PDF
//                             });
//                           });
//                         },
//                         child: ListTile(
//                           title: Text(displayItem[index].title),
//                           leading: Container(
//                             height: 50,
//                             width: 50,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(12),
//                               color: Colors.grey[300],
//                             ),
//                             child: Icon(
//                               Icons.picture_as_pdf,
//                               color: Colors.red,
//                               size: 28,
//                             ),
//                           ),
//                           trailing: Row(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//                               IconButton(
//                                 icon: Icon(
//                                   displayItem[index].isRead
//                                       ? Icons.history
//                                       : Icons.history_outlined,
//                                   color: displayItem[index].isRead
//                                       ? Colors.blue
//                                       : Colors.grey,
//                                 ),
//                                 onPressed: () {
//                                   setState(() {
//                                     displayItem[index].isRead =
//                                         !displayItem[index].isRead;
//                                   });
//                                 },
//                               ),
//                               SizedBox(width: 8),
//                               IconButton(
//                                 icon: _myBox.get('bookmark') != null &&
//                                         _myBox
//                                             .get('bookmark')
//                                             .contains(displayItem[index].id)
//                                     ? Icon(Icons.favorite, color: Colors.red)
//                                     : Icon(Icons.favorite_border),
//                                 onPressed: () {
//                                   setState(() {
//                                     addToBookmark(displayItem[index].id);
//                                   });
//                                 },
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//                 )
//               : SizedBox(
//                   height: MediaQuery.of(context).size.height,
//                   child: ListView.builder(
//                     itemCount: displayItem.length,
//                     itemBuilder: (context, index) {
//                       return InkWell(
//                         onTap: () {
//                           markPDFAsRead(displayItem[index].id);
//                           setState(() {
//                             selectedPDFId = displayItem[index].id;
//                           });
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => Viewer(
//                                 url:
//                                     'http://172.20.10.6:8000/storage/${displayItem[index].firebase_url}',
//                               ),
//                             ),
//                           ).then((_) {
//                             setState(() {
//                               selectedPDFId = null;
//                             });
//                           });
//                         },
//                         child: ListTile(
//                           title: Text(displayItem[index].title),
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//         ),
//       ],
//     );
//   }

  // void fetchPost() async {
  //   final response =
  //       await http.get(Uri.parse('http://172.20.10.6:8000/api/dashboard'));
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final result = json as List<dynamic>;

  //   final transform = result.map((e) {
  //     return Post(
  //       data_file: e['data_file'],
  //       firebase_url: e['firebase_url'],
  //       id: e['id'],
  //       title: e['title'],
  //       description: e['description'],
  //     );
  //   }).toList();

  //   setState(() {
  //     posts = transform;
  //     displayItem = List.from(posts);
  //   });
  // }

//   void searchData(String query) {
//     setState(() {
//       isSearching = true;
//       displayItem = posts
//           .where(
//               (post) => post.title.toLowerCase().contains(query.toLowerCase()))
//           .toList();
//     });
//   }

//   void markPDFAsRead(int id) {
//     readPDFIds.removeWhere((oldId) => oldId == id);
//     if (!readPDFIds.contains(id)) {
//       setState(() {
//         readPDFIds.add(id);
//       });
//     }
//   }
// }


// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihanuud.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihanperbawaslu.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilukeputusan.dart';
// import 'package:flutter_api_bawaslu/views/searchpemilihankeputusan.dart';
// import 'package:flutter_api_bawaslu/views/searchpemilihanperbawaslu.dart';
// import 'package:flutter_api_bawaslu/views/searchpemilihanuud.dart';
// import 'package:flutter/services.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart';

// class pemilihan extends StatefulWidget {
//   const pemilihan({super.key});

//   @override
//   _pemilihanState createState() => _pemilihanState();
// }

// class _pemilihanState extends State<pemilihan> {
//   TextEditingController searchDatauser = TextEditingController();

//   void highlightSearchTerm(String searchTerm) async {
//     try {
//       String command = '''
//       <?xml version="1.0" encoding="UTF-8"?>
//       <xfdf xmlns="http://ns.adobe.com/xfdf/" xml:space="preserve">
//         <search term="$searchTerm" />
//       </xfdf>
//       ''';

//       await PdftronFlutter.importAnnotationCommand(command);
//       print("Search and highlight term: $searchTerm");
//     } on PlatformException catch (e) {
//       print("Failed to search and highlight text: '${e.message}'.");
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Pemilihan',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61), // warna AppBar
//       ),
//       backgroundColor: Color.fromRGBO(255, 255, 255, 1),
//       body: Stack(
//         children: [
//           // Gambar latar belakang
//           Positioned.fill(
//             child: Image.asset(
//               'images/epasalwhite.jpg',
//               fit: BoxFit.cover,
//               color: Color.fromRGBO(255, 255, 255, 0.3), // Memberikan efek transparansi pada gambar latar belakang
//               colorBlendMode: BlendMode.modulate,
//             ),
//           ),
//           Container(
//             alignment: Alignment.center,
//             child: Column(
//               children: [
//                 // TextField for Search
//                 Container(
//                   height: 100,
//                   width: MediaQuery.of(context).size.width,
//                   margin: const EdgeInsets.all(20.0),
//                   child: TextField(
//                     controller: searchDatauser,
//                     decoration: InputDecoration(
//                       filled: true,
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(20.0),
//                       ),
//                       hintText: 'Cari undang-undang / pasal di sini',
//                       prefixIcon: const Icon(Icons.search),
//                     ),
//                   ),
//                 ),
//                 // Button 1
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       height: 50,
//                       width: 30,
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => pemilihanuud(searchTerm: searchDatauser.text)),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFFbc9d61), // Memberikan warna latar belakang tombol
//                       ),
//                       icon: Image.asset(
//                         'images/law.png',
//                         height: 30,
//                         width: 30,
//                       ),
//                       label: Text(
//                         'Undang-Undang Pemilihan',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ), // Mengatur warna teks tombol menjadi putih
//                     ),
//                   ],
//                 ),
//                 // Button 2
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       height: 50,
//                       width: 30,
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => pemilihanperbawaslu(searchTerm: searchDatauser.text)),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFFbc9d61), // Memberikan warna latar belakang tombol
//                       ),
//                       icon: Image.asset(
//                         'images/law.png',
//                         height: 30,
//                         width: 30,
//                       ),
//                       label: Text(
//                         '           PERBAWASLU           ',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 // Button 3
//                 Column(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     Container(
//                       height: 50,
//                       width: 30,
//                     ),
//                     ElevatedButton.icon(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => pemilihankeputusan(searchTerm: searchDatauser.text)),
//                         );
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: Color(0xFFbc9d61), // Memberikan warna latar belakang tombol
//                       ),
//                       icon: Image.asset(
//                         'images/law.png',
//                         height: 30,
//                         width: 30,
//                       ),
//                       label: Text(
//                         '     Keputusan BAWASLU    ',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

//bisaaaaa

import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihanKeputusan.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_api_bawaslu/models/post.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihanuud.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihanperbawaslu.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilukeputusan.dart';
import 'package:flutter_api_bawaslu/views/searchpemilihankeputusan.dart';
import 'package:flutter_api_bawaslu/views/searchpemilihanperbawaslu.dart';
import 'package:flutter_api_bawaslu/views/searchpemilihanuud.dart';

class Pemilihan extends StatelessWidget {
  const Pemilihan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Pemilihan',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFbc9d61), // warna AppBar
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: PDFSearchDelegate(),
              );
            },
          ),
        ],
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
                          MaterialPageRoute(builder: (context) => pemilihanuud()),
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
                      label: Text(
                        'Undang-Undang Pemilihan',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ), // Mengatur warna teks tombol menjadi putih),
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
                          MaterialPageRoute(builder: (context) => pemilihanperbawaslu()),
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
                      label: Text(
                        '           PERBAWASLU           ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
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
                          MaterialPageRoute(builder: (context) => pemilihankeputusan()),
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
                      label: Text(
                        '     Keputusan BAWASLU    ',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class PDFSearchDelegate extends SearchDelegate {
  List<Post> posts = [];
  TextEditingController searchDatauser = TextEditingController();
  List<Post> displayItem = [];

  Future<void> fetchPosts() async {
    final response = await http.get(Uri.parse('http://172.20.10.6:8000/api/dashboard'));
    final body = response.body;
    final json = jsonDecode(body);
    final result = json as List<dynamic>;
    final transform = result.map((e) {
      return Post(
        data_file: e['data_file'],
        firebase_url: e['firebase_url'],
        id: e['id'],
        title: e['title'],
        description: e['description'],
      );
    }).toList();
    posts = transform;
    displayItem = List.from(posts);
  }
 

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
Widget buildResults(BuildContext context) {
  final results = posts
      .where((post) =>
          post.title.toLowerCase().contains(query.toLowerCase()) ||
          post.description.toLowerCase().contains(query.toLowerCase()))
      .toList();

  return ListView.builder(
    itemCount: results.length,
    itemBuilder: (context, index) {
      return ListTile(
        title: Text(results[index].title),
        subtitle: Text(results[index].description),
        onTap: () {
          // Navigate to the respective page based on result
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Viewer(
                url: displayItem[index].firebase_url,
                searchTerm: query, // Pass the search query as the searchTerm
              ),
            ),
          );
        },
      );
    },
  );
}


  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestions = posts
        .where((post) =>
            post.title.toLowerCase().contains(query.toLowerCase()) ||
            post.description.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(suggestions[index].title),
          subtitle: Text(suggestions[index].description),
          onTap: () {
            query = suggestions[index].title;
            showResults(context);
          },
        );
      },
    );
  }

  @override
  void showResults(BuildContext context) {
    fetchPosts().then((_) {
      super.showResults(context);
    });
  }

  @override
  void showSuggestions(BuildContext context) {
    fetchPosts().then((_) {
      super.showSuggestions(context);
    });
  }
}


