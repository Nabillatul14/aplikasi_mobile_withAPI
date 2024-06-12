// // import 'dart:convert';
// // import 'package:flutter_api_bawaslu/models/post.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
// // import 'package:http/http.dart' as http;
// // // import 'package:flutter_api_bawaslu/provider/simpan.dart';
// // // import 'package:flutter_api_bawaslu/simpan_bookmark.dart';
// // // import 'package:provider/provider.dart';
// // import 'package:hive/hive.dart';

// // class Post {
// //   final int id;
// //   final String title;
// //   final String data_file;
// //   bool isRead;

// //   Post({
// //     required this.id,
// //     required this.title,
// //     required this.data_file,
// //     this.isRead = false,
// //   });
// // }

// // class pemilihankeputusan extends StatefulWidget {
// //   const pemilihankeputusan({super.key});

// //   @override
// //   State<pemilihankeputusan> createState() => _pemilihankeputusanState();
// // }

// // class _pemilihankeputusanState extends State<pemilihankeputusan> {
// //   final _myBox = Hive.box('Favourite');
// //   List<int> readPDFIds =
// //       []; // List untuk menyimpan ID file PDF yang telah dibaca

// //   // void writeData(int value) {
// //   //   // List<int> exist = _myBox.get('bookmark');
// //   //   List<int> exist = List.from(_myBox.get('bookmark') ?? []);
// //   //   _myBox.put('bookmark', exist.add(value));
// //   //   print(_myBox.get('bookmark'));
// //   // }

// //   // void writeData(value) {
// //   //   List exist = List.from(_myBox.get('bookmark') ?? []);
// //   //   exist.add(value);
// //   //   _myBox.put('bookmark', exist);
// //   //   print(_myBox.get('bookmark'));
// //   // }

// //   // void writeData(int value) {
// //   //   List<int> exist = List.from(_myBox.get('bookmark') ?? []);
// //   //   exist.add(value);
// //   //   _myBox.put('bookmark', exist); // Pastikan exist adalah List, bukan int
// //   //   print(_myBox.get('bookmark'));
// //   // }

// //   // void writeData(int value) {
// //   //   var bookmarkData = _myBox.get('bookmark');
// //   //   List<int> exist = <int>[]; // Inisialisasi list dengan tipe int
// //   //   if (bookmarkData != null) {
// //   //     if (bookmarkData is List<dynamic>) {
// //   //       exist = bookmarkData
// //   //           .cast<int>()
// //   //           .toList(); // Konversi List<dynamic> menjadi List<int>
// //   //     } else if (bookmarkData is List<int>) {
// //   //       exist = bookmarkData; // Gunakan langsung jika sudah bertipe List<int>
// //   //     }
// //   //   }
// //   //   exist.add(value);
// //   //   _myBox.put('bookmark', exist);
// //   //   print(_myBox.get('bookmark'));
// //   // }

// //   void addToBookmark(int id) {
// //     var bookmarkData = _myBox.get('bookmark') ?? [];
// //     if (!bookmarkData.contains(id)) {
// //       bookmarkData.add(id);
// //       _myBox.put('bookmark', bookmarkData);
// //       print('Item berhasil ditambahkan ke bookmark');
// //     } else {
// //       print('Item sudah ada di dalam bookmark');
// //     }
// //   }

// //   // list get data api
// //   List<Post> posts = [];

// //   // text editing search
// //   TextEditingController searchDatauser = TextEditingController();

// //   // list display
// //   late List<Post> displayItem = List.from(posts);

// //   @override
// //   void initState() {
// //     super.initState();
// //     fetchPost();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: const Text('File Keputusan BAWASLU',
// //             style: TextStyle(
// //                 color: Colors.white,
// //                 fontWeight: FontWeight.bold,
// //                 fontSize: 25)),
// //         centerTitle: true,
// //         backgroundColor: Color(0xFFbc9d61),
// //         leading: IconButton(
// //           icon: Icon(Icons.arrow_back, color: Colors.black),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //       ),
// //       body: ListView(
// //         children: [
// //           Container(
// //             height: 100,
// //             width: MediaQuery.of(context).size.width,
// //             margin: const EdgeInsets.all(20.0),
// //             child: TextField(
// //               controller: searchDatauser,
// //               onChanged: ((value) => searchData(value)),
// //               decoration: InputDecoration(
// //                   filled: true,
// //                   border: OutlineInputBorder(
// //                       borderRadius: BorderRadius.circular(20.0)),
// //                   hintText: 'Cari undang-undang / pasal di sini',
// //                   prefixIcon: const Icon(Icons.search)),
// //             ),
// //           ),
// //           Container(
// //               padding: const EdgeInsets.all(20.0),
// //               child: (searchDatauser.text == '')
// //                   ? SizedBox(
// //                       height: MediaQuery.of(context).size.height,
// //                       child: ListView.builder(
// //                         itemCount: displayItem.length,
// //                         itemBuilder: (context, index) {
// //                           bool isRead =
// //                               readPDFIds.contains(displayItem[index].id);
// //                           return InkWell(
// //                             onTap: () async {
// //                               // Tandai file PDF sebagai telah dibaca saat dibuka
// //                               markPDFAsRead(displayItem[index].id);

// //                               // Navigasi ke tampilan PDF
// //                               Navigator.push(
// //                                 context,
// //                                 MaterialPageRoute(
// //                                     builder: (context) => PDFViewerFromUrl(
// //                                         url:
// //                                             'http://192.168.1.29:8000/storage/${displayItem![index].data_file}')),
// //                               );
// //                               // Setelah pengguna kembali dari tampilan PDF, perbarui tampilan jika perlu
// //                               setState(() {
// //                                 // Misalnya, jika Anda ingin mengganti warna ikon berdasarkan status PDF setelah kembali
// //                                 // Anda dapat memeriksa kembali status pembacaan PDF di sini dan memperbarui displayItem
// //                                 displayItem = displayItem.map((item) {
// //                                   // Periksa apakah ID item ada dalam readPDFIds
// //                                   bool isRead = readPDFIds.contains(item.id);

// //                                   // Jika sudah dibaca, maka ubah warna ikon menjadi biru, jika belum, biarkan merah
// //                                   item.isRead = isRead;

// //                                   displayItem[index].isRead = true;

// //                                   return item;
// //                                 }).toList();
// //                               });
// //                             },
// //                             child: ListTile(
// //                               title: Text(displayItem[index].title),
// //                               leading: Container(
// //                                 height: 50,
// //                                 width: 50,
// //                                 decoration: BoxDecoration(
// //                                   borderRadius: BorderRadius.circular(12),
// //                                   color: Colors.grey[300],
// //                                 ),
// //                                 child: Icon(
// //                                   Icons.picture_as_pdf,
// //                                   color: Colors.red,
// //                                   size: 28,
// //                                 ),
// //                               ),
// //                               // trailing: IconButton(
// //                               //   icon: Icon(
// //                               //     Icons.favorite_border,
// //                               //     color: Colors.red,
// //                               //   ),
// //                               //   onPressed: () {
// //                               //     print(displayItem[index].id);
// //                               //     // List exist = List.from(_myBox.get('bookmark') ?? []);
// //                               //     // var exist = _myBox.get('bookmark') ?? [];
// //                               //     var exist = _myBox.get('bookmark') as List<int>? ?? [];
// //                               //     exist.add(displayItem[index].id);
// //                               //     _myBox.put('bookmark', exist); // Pastikan exist adalah List, bukan int
// //                               //     print(_myBox.get('bookmark'));
// //                               //   },
// //                               // ),

// //                               // trailing: IconButton(
// //                               //   icon: Icon(
// //                               //     Icons.favorite_border,
// //                               //     color: Colors.red,
// //                               //   ),
// //                               //   onPressed: () {
// //                               //     print(displayItem[index].id);
// //                               //     var exist =
// //                               //         _myBox.get('bookmark') as List<int>? ??
// //                               //             [];
// //                               //     exist.add(displayItem[index].id);
// //                               //     _myBox.put('bookmark',
// //                               //         exist); // Pastikan exist adalah List<int>, bukan List<dynamic>
// //                               //     print(_myBox.get('bookmark'));
// //                               //   },
// //                               // ),
// //                               //             trailing: IconButton(
// //                               //               icon: _myBox.get('bookmark') != null &&
// //                               //                       _myBox
// //                               //                           .get('bookmark')
// //                               //                           .contains(displayItem[index].id)
// //                               //                   ? Icon(Icons.favorite, color: Colors.red)
// //                               //                   : Icon(Icons.favorite_border),
// //                               //               onPressed: () {
// //                               //                 setState(() {
// //                               //                   addToBookmark(displayItem[index].id);
// //                               //                 });
// //                               //               },
// //                               //             ),
// //                               //           ));
// //                               //     },
// //                               //   ),
// //                               // )
// //                               trailing: IconButton(
// //                                 icon: _myBox.get('bookmark') != null &&
// //                                         _myBox
// //                                             .get('bookmark')
// //                                             .contains(displayItem[index].id)
// //                                     ? Icon(Icons.favorite, color: Colors.red)
// //                                     : Icon(Icons.favorite_border),
// //                                 onPressed: () {
// //                                   setState(() {
// //                                     addToBookmark(displayItem[index].id);
// //                                   });
// //                                 },
// //                               ),
// //                             ),
// //                           );
// //                         },
// //                       ),
// //                     )
// //                   : SizedBox(
// //                       height: MediaQuery.of(context).size.height,
// //                       child: ListView.builder(
// //                         itemCount: displayItem.length,
// //                         itemBuilder: (context, index) {
// //                           // final email = datauser.email;
// //                           return InkWell(
// //                               onTap: () {
// //                                 // Tandai file PDF sebagai telah dibaca saat dibuka
// //                                 markPDFAsRead(displayItem[index].id);

// //                                 Navigator.push(
// //                                   context,
// //                                   MaterialPageRoute(
// //                                       builder: (context) => PDFViewerFromUrl(
// //                                           url:
// //                                               'http://192.168.1.29:8000/storage/${displayItem![index].data_file}')),
// //                                 );
// //                                 print("test");
// //                               },
// //                               child: ListTile(
// //                                 title: Text(displayItem[index].title),

// //                                 // subtitle: Text(posts[index].data_file),
// //                               ));
// //                         },
// //                       ),
// //                     ))
// //         ],
// //       ),
// //     );
// //   }

// //   void fetchPost() async {
// //     final response = await http
// //         .get(Uri.parse('http://192.168.1.29:8000/api/pemilihanKeputusan'));
// //     final body = response.body;
// //     final json = jsonDecode(body);
// //     final result = json as List<dynamic>;
// //     final transform = result.map((e) {
// //       return Post(
// //         data_file: e['data_file'],
// //         id: e['id'],
// //         title: e['title'],
// //       );
// //     }).toList();
// //     setState(() {
// //       posts = transform;
// //       displayItem = List.from(posts);
// //     });
// //     print('');
// //   }

// //   void searchData(String data) {
// //     setState(() {
// //       displayItem = posts
// //           .where(
// //               (value) => value.title.toLowerCase().contains(data.toLowerCase()))
// //           .toList();
// //     });
// //   }

// //   void markPDFAsRead(int id) {
// //     // Hapus ID file PDF yang lama dari readPDFIds
// //     readPDFIds.removeWhere((oldId) => oldId == id);

// //     // Tambahkan ID file PDF yang baru ke readPDFIds
// //     if (!readPDFIds.contains(id)) {
// //       setState(() {
// //         readPDFIds.add(id);
// //       });
// //     }
// //   }
// // }

// // batas

// import 'dart:convert';
// import 'package:flutter_api_bawaslu/models/post.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
// import 'package:http/http.dart' as http;
// import 'package:hive/hive.dart';
// // import 'package:pdf_text/pdf_text.dart';

// class pemilihankeputusan extends StatefulWidget {
//   const pemilihankeputusan({Key? key}) : super(key: key);

//   @override
//   State<pemilihankeputusan> createState() => _pemilihankeputusanState();
// }

// class _pemilihankeputusanState extends State<pemilihankeputusan> {
//   late Box _myBox;
//   List<int> readPDFIds = [];
//   int? selectedPDFId;

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

//   List<Post> posts = [];
//   TextEditingController searchDatauser = TextEditingController();
//   late List<Post> displayItem = List.from(posts);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'File Keputusan BAWASLU',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width,
//             margin: const EdgeInsets.all(20.0),
//             child: TextField(
//               controller: searchDatauser,
//               onChanged: ((value) => searchData(value)),
//               decoration: InputDecoration(
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 hintText: 'Cari undang-undang / pasal di sini',
//                 prefixIcon: const Icon(Icons.search),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(20.0),
//             child: (searchDatauser.text == '')
//                 ? SizedBox(
//                     height: MediaQuery.of(context).size.height,
//                     child: ListView.builder(
//                       itemCount: displayItem.length,
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             markPDFAsRead(displayItem[index].id);
//                             setState(() {
//                               selectedPDFId = displayItem[index].id;
//                             });
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Viewer(
//                                   url: displayItem[index].firebase_url,
//                                 ),
//                               ),
//                             ).then((_) {
//                               setState(() {
//                                 selectedPDFId =
//                                     null; // Reset selectedPDFId setelah kembali dari tampilan PDF
//                               });
//                             });
//                           },
//                           child: ListTile(
//                             title: Text(displayItem[index].title),
//                             leading: Container(
//                               height: 50,
//                               width: 50,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(12),
//                                 color: Colors.grey[300],
//                               ),
//                               // child: Icon(
//                               //   Icons.picture_as_pdf,
//                               //   color: selectedPDFId == displayItem[index].id
//                               //       ? Colors.blue
//                               //       : readPDFIds.contains(displayItem[index].id)
//                               //           ? Colors.blue
//                               //           : Colors.red,
//                               //   size: 28,
//                               // ),
//                               child: Icon(
//                                 Icons.picture_as_pdf,
//                                 color: Colors.red,
//                                 size: 28,
//                               ),
//                             ),
//                             trailing: Row(
//                               mainAxisSize: MainAxisSize.min,
//                               children: [
//                                 IconButton(
//                                   icon: Icon(
//                                     displayItem[index].isRead
//                                         ? Icons.history
//                                         : Icons.history_outlined,
//                                     color: displayItem[index].isRead
//                                         ? Colors.blue
//                                         : Colors.grey,
//                                   ),
//                                   onPressed: () {
//                                     setState(() {
//                                       displayItem[index].isRead =
//                                           !displayItem[index].isRead;
//                                     });
//                                   },
//                                 ),
//                                 SizedBox(width: 8),
//                                 IconButton(
//                                   icon: _myBox.get('bookmark') != null &&
//                                           _myBox
//                                               .get('bookmark')
//                                               .contains(displayItem[index].id)
//                                       ? Icon(Icons.favorite, color: Colors.red)
//                                       : Icon(Icons.favorite_border),
//                                   onPressed: () {
//                                     setState(() {
//                                       addToBookmark(displayItem[index].id);
//                                     });
//                                   },
//                                 ),
//                               ],
//                             ),
//                           ),
//                         );
//                       },
//                     ),
//                   )
//                 : SizedBox(
//                     height: MediaQuery.of(context).size.height,
//                     child: ListView.builder(
//                       itemCount: displayItem.length,
//                       itemBuilder: (context, index) {
//                         return InkWell(
//                           onTap: () {
//                             markPDFAsRead(displayItem[index].id);
//                             setState(() {
//                               selectedPDFId = displayItem[index].id;
//                             });
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                 builder: (context) => Viewer(
//                                   url:
//                                       'http://192.168.43.198:8000/storage/${displayItem[index].firebase_url}',
//                                 ),
//                               ),
//                             ).then((_) {
//                               setState(() {
//                                 selectedPDFId = null;
//                               });
//                             });
//                           },
//                           child: ListTile(
//                             title: Text(displayItem[index].title),
//                           ),
//                         );
//                       },
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }

//   void fetchPost() async {
//     final response = await http
//         .get(Uri.parse('http://192.168.43.198:8000/api/pemilihanKeputusan'));
//     final body = response.body;
//     final json = jsonDecode(body);
//     final result = json as List<dynamic>;
//     final transform = result.map((e) {
//       return Post(
//         data_file: e['data_file'],
//         firebase_url: e['firebase_url'],
//         id: e['id'],
//         title: e['title'],
//         description: e['description'],
//       );
//     }).toList();
//     setState(() {
//       posts = transform;
//       displayItem = List.from(posts);
//     });
//   }

//   void searchData(String data) {
//     setState(() {
//       displayItem = posts
//           .where(
//               (value) => value.title.toLowerCase().contains(data.toLowerCase()))
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

// // bisa searching dan masuk ke pdf view

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/models/post.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
// import 'package:http/http.dart' as http;
// import 'package:hive/hive.dart';

// class pemilihankeputusan extends StatefulWidget {
//   const pemilihankeputusan({Key? key}) : super(key: key);

//   @override
//   State<pemilihankeputusan> createState() => _pemilihankeputusanState();
// }

// class _pemilihankeputusanState extends State<pemilihankeputusan> {
//   late Box _myBox;
//   List<Post> posts = [];
//   TextEditingController searchDatauser = TextEditingController();
//   List<Post> displayItem = [];

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

//   void fetchPost() async {
//     final response = await http
//         .get(Uri.parse('http://192.168.43.198:8000/api/pemilihanKeputusan'));
//     final body = response.body;
//     final json = jsonDecode(body);
//     final result = json as List<dynamic>;
//     final transform = result.map((e) {
//       return Post(
//         data_file: e['data_file'],
//         firebase_url: e['firebase_url'],
//         id: e['id'],
//         title: e['title'],
//         description: e['description'],
//       );
//     }).toList();
//     setState(() {
//       posts = transform;
//       displayItem = List.from(posts);
//     });
//   }

//   void searchData(String data) {
//     setState(() {
//       displayItem = posts
//           .where(
//               (value) => value.title.toLowerCase().contains(data.toLowerCase()))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'File Keputusan BAWASLU',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width,
//             margin: const EdgeInsets.all(20.0),
//             child: TextField(
//               controller: searchDatauser,
//               onChanged: ((value) => searchData(value)),
//               decoration: InputDecoration(
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 hintText: 'Cari undang-undang / pasal di sini',
//                 prefixIcon: const Icon(Icons.search),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(20.0),
//             child: searchDatauser.text == ''
//                 ? buildListView(displayItem)
//                 : buildListView(displayItem),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildListView(List<Post> displayItem) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height,
//       child: ListView.builder(
//         itemCount: displayItem.length,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Viewer(
//                     url: displayItem[index].firebase_url,
//                   ),
//                 ),
//               );
//             },
//             child: ListTile(
//               title: Text(displayItem[index].title),
//               leading: Container(
//                 height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.grey[300],
//                 ),
//                 child: Icon(
//                   Icons.picture_as_pdf,
//                   color: Colors.red,
//                   size: 28,
//                 ),
//               ),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: _myBox.get('bookmark') != null &&
//                             _myBox
//                                 .get('bookmark')
//                                 .contains(displayItem[index].id)
//                         ? Icon(Icons.favorite, color: Colors.red)
//                         : Icon(Icons.favorite_border),
//                     onPressed: () {
//                       setState(() {
//                         addToBookmark(displayItem[index].id);
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// bisa searching dan masuk ke pdf view new modified
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/models/post.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
// import 'package:http/http.dart' as http;
// import 'package:hive/hive.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart'; // Import library PdftronFlutter.dart

// class pemilihankeputusan extends StatefulWidget {
//   const pemilihankeputusan({Key? key}) : super(key: key);

//   @override
//   State<pemilihankeputusan> createState() => _pemilihankeputusanState();
// }

// class _pemilihankeputusanState extends State<pemilihankeputusan> {
//   late Box _myBox;
//   List<Post> posts = [];
//   TextEditingController searchDatauser = TextEditingController();
//   List<Post> displayItem = [];

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

//   void addToBookmark(int? id) {
//     if (id != null) {
//       var bookmarkData = _myBox.get('bookmark') ?? [];
//       if (!bookmarkData.contains(id)) {
//         bookmarkData.add(id);
//         _myBox.put('bookmark', bookmarkData);
//         print('Item berhasil ditambahkan ke bookmark');
//       } else {
//         print('Item sudah ada di dalam bookmark');
//       }
//     }
//   }

//   void fetchPost() async {
//     final response = await http
//         .get(Uri.parse('http://172.20.10.6:8000/api/pemilihanKeputusan'));
//     final body = response.body;
//     final json = jsonDecode(body);
//     final result = json as List<dynamic>;
//     final transform = result.map((e) {
//       return Post(
//         data_file: e['data_file'],
//         firebase_url: e['firebase_url'],
//         id: e['id'],
//         title: e['title'],
//         description: e['description'],
//       );
//     }).toList();
//     setState(() {
//       posts = transform;
//       displayItem = List.from(posts);
//     });
//   }

//   void _onSearch(String searchText) {
//     searchData(searchText);
//   }

//   void searchData(String data) {
//     setState(() {
//       if (data.isEmpty) {
//         displayItem = List.from(posts);
//       } else {
//         displayItem = posts.where((post) {
//           return post.title.toLowerCase().contains(data.toLowerCase());
//         }).toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'File Keputusan BAWASLU',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width,
//             margin: const EdgeInsets.all(20.0),
//             child: TextField(
//               controller: searchDatauser,
//               onChanged: ((value) => _onSearch(value)),
//               decoration: InputDecoration(
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 hintText: 'Cari undang-undang / pasal di sini',
//                 prefixIcon: const Icon(Icons.search),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(20.0),
//             child: buildListView(displayItem),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildListView(List<Post> displayItem) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height,
//       child: ListView.builder(
//         itemCount: displayItem.length,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Viewer(
//                     url: displayItem[index].firebase_url,
//                     searchTerm: searchDatauser.text,
//                   ),
//                 ),
//               );
//             },
//             child: ListTile(
//               title: Text(displayItem[index].title),
//               leading: Container(
//                 height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.grey[300],
//                 ),
//                 child: Icon(
//                   Icons.picture_as_pdf,
//                   color: Colors.red,
//                   size: 28,
//                 ),
//               ),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: _myBox.get('bookmark') != null &&
//                             _myBox
//                                 .get('bookmark')
//                                 .contains(displayItem[index].id)
//                         ? Icon(Icons.favorite, color: Colors.red)
//                         : Icon(Icons.favorite_border),
//                     onPressed: () {
//                       setState(() {
//                         addToBookmark(displayItem[index].id);
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

// higlight search term new modified

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/models/post.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
// import 'package:http/http.dart' as http;
// import 'package:hive/hive.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart'; // Import library PdftronFlutter.dart

// class pemilihankeputusan extends StatefulWidget {
//   const pemilihankeputusan({Key? key}) : super(key: key);

//   @override
//   State<pemilihankeputusan> createState() => _pemilihankeputusanState();
// }

// class _pemilihankeputusanState extends State<pemilihankeputusan> {
//   late Box _myBox;
//   List<Post> posts = [];
//   TextEditingController searchDatauser = TextEditingController();
//   List<Post> displayItem = [];

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

//   void addToBookmark(int? id) {
//     if (id != null) {
//       var bookmarkData = _myBox.get('bookmark') ?? [];
//       if (!bookmarkData.contains(id)) {
//         bookmarkData.add(id);
//         _myBox.put('bookmark', bookmarkData);
//         print('Item berhasil ditambahkan ke bookmark');
//       } else {
//         print('Item sudah ada di dalam bookmark');
//       }
//     }
//   }

//   void fetchPost() async {
//     final response = await http
//         .get(Uri.parse('http://172.20.10.6:8000/api/pemilihanKeputusan'));
//     final body = response.body;
//     final json = jsonDecode(body);
//     final result = json as List<dynamic>;
//     final transform = result.map((e) {
//       return Post(
//         data_file: e['data_file'],
//         firebase_url: e['firebase_url'],
//         id: e['id'],
//         title: e['title'],
//         description: e['description'],
//       );
//     }).toList();
//     setState(() {
//       posts = transform;
//       displayItem = List.from(posts);
//     });
//   }

//   void _onSearch(String searchText) {
//     searchData(searchText);
//   }

//   void searchData(String data) {
//     setState(() {
//       if (data.isEmpty) {
//         displayItem = List.from(posts);
//       } else {
//         displayItem = posts.where((post) {
//           return post.title.toLowerCase().contains(data.toLowerCase()) ||
//               post.description.toLowerCase().contains(data.toLowerCase());
//         }).toList();
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'File Keputusan BAWASLU',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width,
//             margin: const EdgeInsets.all(20.0),
//             child: TextField(
//               controller: searchDatauser,
//               onChanged: ((value) => _onSearch(value)),
//               decoration: InputDecoration(
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 hintText: 'Cari undang-undang di sini',
//                 prefixIcon: const Icon(Icons.search),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(20.0),
//             child: buildListView(displayItem),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildListView(List<Post> displayItem) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height,
//       child: ListView.builder(
//         itemCount: displayItem.length,
//         itemBuilder: (context, index) {
//           return InkWell(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Viewer(
//                     url: displayItem[index].firebase_url,
//                     searchTerm: searchDatauser.text,
//                   ),
//                 ),
//               );
//             },
//             child: ListTile(
//               title:
//                   _highlightText(displayItem[index].title, searchDatauser.text),
//               subtitle: _highlightText(
//                   displayItem[index].description, searchDatauser.text),
//               leading: Container(
//                 height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: Colors.grey[300],
//                 ),
//                 child: Icon(
//                   Icons.picture_as_pdf,
//                   color: Colors.red,
//                   size: 28,
//                 ),
//               ),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: _myBox.get('bookmark') != null &&
//                             _myBox
//                                 .get('bookmark')
//                                 .contains(displayItem[index].id)
//                         ? Icon(Icons.favorite, color: Colors.red)
//                         : Icon(Icons.favorite_border),
//                     onPressed: () {
//                       setState(() {
//                         addToBookmark(displayItem[index].id);
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _highlightText(String text, String searchTerm) {
//     if (searchTerm.isEmpty) {
//       return Text(text);
//     }

//     List<TextSpan> spans = [];
//     int start = 0;
//     int index = text.toLowerCase().indexOf(searchTerm.toLowerCase());

//     while (index != -1) {
//       if (index > start) {
//         spans.add(TextSpan(text: text.substring(start, index)));
//       }

//       spans.add(TextSpan(
//           text: text.substring(index, index + searchTerm.length),
//           style: TextStyle(backgroundColor: Colors.yellow)));

//       start = index + searchTerm.length;
//       index = text.toLowerCase().indexOf(searchTerm.toLowerCase(), start);
//     }

//     if (start < text.length) {
//       spans.add(TextSpan(text: text.substring(start)));
//     }

//     return RichText(
//         text: TextSpan(style: TextStyle(color: Colors.black), children: spans));
//   }
// }

// terakhir dilihat bisa, tampilan search sudah, highlight sudah
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/models/post.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
// import 'package:http/http.dart' as http;
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart'; // Import Hive Flutter untuk inisialisasi Hive
// import 'package:pdftron_flutter/pdftron_flutter.dart'; // Import library PdftronFlutter.dart

// class pemilihankeputusan extends StatefulWidget {
//   const pemilihankeputusan({Key? key}) : super(key: key);

//   @override
//   State<pemilihankeputusan> createState() => _pemilihankeputusanState();
// }

// class _pemilihankeputusanState extends State<pemilihankeputusan> {
//   late Box _myBox;
//   List<Post> posts = [];
//   TextEditingController searchDatauser = TextEditingController();
//   List<Post> displayItem = [];
//   int lastSeenIndex = -1; // Menyimpan indeks item terakhir yang dilihat

//   @override
//   void initState() {
//     super.initState();
//     _initHive();
//   }

//   void _initHive() async {
//     await Hive.initFlutter(); // Inisialisasi Hive Flutter
//     await openHiveBoxes();
//     fetchPost();
//     loadLastSeenIndex();
//   }

//   Future<void> openHiveBoxes() async {
//     await Hive.openBox('Favourite');
//     _myBox = Hive.box('Favourite');
//   }

//   void addToBookmark(int? id) {
//     if (id != null) {
//       var bookmarkData = _myBox.get('bookmark') ?? [];
//       if (!bookmarkData.contains(id)) {
//         bookmarkData.add(id);
//         _myBox.put('bookmark', bookmarkData);
//         print('Item berhasil ditambahkan ke bookmark');
//       } else {
//         print('Item sudah ada di dalam bookmark');
//       }
//     }
//   }

//   Future<void> fetchPost() async {
//     final response = await http
//         .get(Uri.parse('http://172.20.10.6:8000/api/pemilihanKeputusan'));
//     if (response.statusCode == 200) {
//       final body = response.body;
//       final json = jsonDecode(body);
//       final result = json as List<dynamic>;
//       final transform = result.map((e) {
//         return Post(
//           data_file: e['data_file'],
//           firebase_url: e['firebase_url'],
//           id: e['id'],
//           title: e['title'],
//           description: e['description'],
//         );
//       }).toList();
//       setState(() {
//         posts = transform;
//         displayItem = List.from(posts);
//       });
//     } else {
//       print('Failed to load posts');
//     }
//   }

//   void _onSearch(String searchText) {
//     searchData(searchText);
//   }

//   void searchData(String data) {
//     setState(() {
//       if (data.isEmpty) {
//         displayItem = List.from(posts);
//       } else {
//         displayItem = posts.where((post) {
//           return post.title.toLowerCase().contains(data.toLowerCase()) ||
//               post.description.toLowerCase().contains(data.toLowerCase());
//         }).toList();
//       }
//     });
//   }

//   void loadLastSeenIndex() {
//     int? savedIndex = _myBox.get('lastSeenIndex');
//     if (savedIndex != null) {
//       setState(() {
//         lastSeenIndex = savedIndex;
//       });
//     }
//   }

//   void saveLastSeenIndex(int index) {
//     _myBox.put('lastSeenIndex', index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'File Keputusan BAWASLU',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width,
//             margin: const EdgeInsets.all(20.0),
//             child: TextField(
//               controller: searchDatauser,
//               onChanged: ((value) => _onSearch(value)),
//               decoration: InputDecoration(
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 hintText: 'Cari undang-undang di sini',
//                 prefixIcon: const Icon(Icons.search),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(20.0),
//             child: buildListView(displayItem),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildListView(List<Post> displayItem) {
//     return SizedBox(
//       height: MediaQuery.of(context).size.height,
//       child: ListView.builder(
//         itemCount: displayItem.length,
//         itemBuilder: (context, index) {
//           final bool isLastSeen = index == lastSeenIndex; // Menandai apakah item adalah item terakhir yang dilihat
//           return InkWell(
//             onTap: () {
//               setState(() {
//                 lastSeenIndex = index; // Perbarui indeks item terakhir yang dilihat
//                 saveLastSeenIndex(index); // Simpan indeks item terakhir yang dilihat ke Hive
//               });
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => Viewer(
//                     url: displayItem[index].firebase_url,
//                     searchTerm: searchDatauser.text,
//                   ),
//                 ),
//               );
//             },
//             child: ListTile(
//               title: _highlightText(displayItem[index].title, searchDatauser.text),
//               subtitle: _highlightText(displayItem[index].description, searchDatauser.text),
//               leading: Container(
//                 height: 50,
//                 width: 50,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(12),
//                   color: isLastSeen ? Color(0xFFbc9d61) : Colors.grey[300], // Mengubah warna item jika merupakan item terakhir yang dilihat
//                 ),
//                 child: Icon(
//                   Icons.picture_as_pdf,
//                   color: isLastSeen ? Colors.white : Colors.red,
//                   size: 28,
//                 ),
//               ),
//               trailing: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   IconButton(
//                     icon: _myBox.get('bookmark') != null &&
//                         _myBox.get('bookmark').contains(displayItem[index].id)
//                         ? Icon(Icons.favorite, color: Colors.red)
//                         : Icon(Icons.favorite_border),
//                     onPressed: () {
//                       setState(() {
//                         addToBookmark(displayItem[index].id);
//                       });
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _highlightText(String text, String searchTerm) {
//     if (searchTerm.isEmpty) {
//       return Text(text);
//     }

//     List<TextSpan> spans = [];
//     int start = 0;
//     int index = text.toLowerCase().indexOf(searchTerm.toLowerCase());

//     while (index != -1) {
//       if (index > start) {
//         spans.add(TextSpan(text: text.substring(start, index)));
//       }

//       spans.add(TextSpan(
//           text: text.substring(index, index + searchTerm.length),
//           style: TextStyle(backgroundColor: Colors.amber[400])));

//       start = index + searchTerm.length;
//       index = text.toLowerCase().indexOf(searchTerm.toLowerCase(), start);
//     }

//     if (start < text.length) {
//       spans.add(TextSpan(text: text.substring(start)));
//     }

//     return RichText(
//         text: TextSpan(style: TextStyle(color: Colors.black), children: spans));
//   }
// }

// terakhir dilihat bisa, tampilan search sudah, highlight sudah, saat serching deskripsi muncul
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/models/post.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
// import 'package:http/http.dart' as http;
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart';

// class pemilihankeputusan extends StatefulWidget {
//   const pemilihankeputusan({Key? key}) : super(key: key);

//   @override
//   State<pemilihankeputusan> createState() => _pemilihankeputusanState();
// }

// class _pemilihankeputusanState extends State<pemilihankeputusan> {
//   late Box _myBox;
//   List<Post> posts = [];
//   TextEditingController searchDatauser = TextEditingController();
//   List<Post> displayItem = [];
//   int lastSeenIndex = -1;

//   @override
//   void initState() {
//     super.initState();
//     _initHive();
//   }

//   void _initHive() async {
//     await Hive.initFlutter();
//     await openHiveBoxes();
//     fetchPost();
//     loadLastSeenIndex();
//   }

//   Future<void> openHiveBoxes() async {
//     await Hive.openBox('Favourite');
//     _myBox = Hive.box('Favourite');
//   }

//   void addToBookmark(int? id) {
//     if (id != null) {
//       var bookmarkData = _myBox.get('bookmark') ?? [];
//       if (!bookmarkData.contains(id)) {
//         bookmarkData.add(id);
//         _myBox.put('bookmark', bookmarkData);
//         print('Item berhasil ditambahkan ke bookmark');
//       } else {
//         print('Item sudah ada di dalam bookmark');
//       }
//     }
//   }

//   Future<void> fetchPost() async {
//     final response = await http
//         .get(Uri.parse('http://172.20.10.6:8000/api/pemilihanKeputusan'));
//     if (response.statusCode == 200) {
//       final body = response.body;
//       final json = jsonDecode(body);
//       final result = json as List<dynamic>;
//       final transform = result.map((e) {
//         return Post(
//           data_file: e['data_file'],
//           firebase_url: e['firebase_url'],
//           id: e['id'],
//           title: e['title'],
//           description: e['description'],

//         );
//       }).toList();
//       setState(() {
//         posts = transform;
//         displayItem = List.from(posts);
//       });
//     } else {
//       print('Failed to load posts');
//     }
//   }

//   void _onSearch(String searchText) {
//     searchData(searchText);
//   }

//   void searchData(String data) {
//     setState(() {
//       if (data.isEmpty) {
//         displayItem = List.from(posts);
//       } else {
//         displayItem = posts.where((post) {
//           return post.title.toLowerCase().contains(data.toLowerCase()) ||
//               post.description.toLowerCase().contains(data.toLowerCase());
//         }).toList();
//       }
//     });
//   }

//   void loadLastSeenIndex() {
//     int? savedIndex = _myBox.get('lastSeenIndex');
//     if (savedIndex != null) {
//       setState(() {
//         lastSeenIndex = savedIndex;
//       });
//     }
//   }

//   void saveLastSeenIndex(int index) {
//     _myBox.put('lastSeenIndex', index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'File Keputusan BAWASLU',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width,
//             margin: const EdgeInsets.all(20.0),
//             child: TextField(
//               controller: searchDatauser,
//               onChanged: ((value) => _onSearch(value)),
//               decoration: InputDecoration(
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 hintText: 'Cari undang-undang di sini',
//                 prefixIcon: const Icon(Icons.search),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(20.0),
//             child: buildListView(displayItem),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildListView(List<Post> displayItem) {
//   return SizedBox(
//     height: MediaQuery.of(context).size.height,
//     child: ListView.builder(
//       itemCount: displayItem.length,
//       itemBuilder: (context, index) {
//         final bool isLastSeen = index == lastSeenIndex;
//         return InkWell(
//           onTap: () {
//             setState(() {
//               lastSeenIndex = index;
//               saveLastSeenIndex(index);
//             });
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Viewer(
//                   url: displayItem[index].firebase_url,
//                   searchTerm: searchDatauser.text,
//                 ),
//               ),
//             );
//           },
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ListTile(
//                 title: _highlightText(
//                   displayItem[index].title,
//                   searchDatauser.text,
//                   searchMode: searchDatauser.text.isNotEmpty,
//                 ),
//                 leading: Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: isLastSeen ? Color(0xFFbc9d61) : Colors.grey[300],
//                   ),
//                   child: Icon(
//                     Icons.picture_as_pdf,
//                     color: isLastSeen ? Colors.white : Colors.red,
//                     size: 28,
//                   ),
//                 ),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: _myBox.get('bookmark') != null &&
//                               _myBox.get('bookmark').contains(displayItem[index].id)
//                           ? Icon(Icons.favorite, color: Colors.red)
//                           : Icon(Icons.favorite_border),
//                       onPressed: () {
//                         setState(() {
//                           addToBookmark(displayItem[index].id);
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               if (searchDatauser.text.isNotEmpty) // Hanya tampilkan deskripsi saat dalam mode pencarian
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: _highlightText(
//                     displayItem[index].description,
//                     searchDatauser.text,
//                     searchMode: true,
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     ),
//   );
// }

//   Widget _highlightText(String text, String searchTerm,
//       {bool searchMode = false}) {
//     if (!searchMode || searchTerm.isEmpty) {
//       return Text(text);
//     }

//     List<TextSpan> spans = [];
//     int start = 0;
//     int index = text.toLowerCase().indexOf(searchTerm.toLowerCase());

//     while (index != -1) {
//       if (index > start) {
//         spans.add(TextSpan(text: text.substring(start, index)));
//       }

//       spans.add(TextSpan(
//           text: text.substring(index, index + searchTerm.length),
//           style: TextStyle(backgroundColor: Colors.amber[400])));

//       start = index + searchTerm.length;
//       index = text.toLowerCase().indexOf(searchTerm.toLowerCase(), start);
//     }

//     if (start < text.length) {
//       spans.add(TextSpan(text: text.substring(start)));
//     }

//     return RichText(
//         text: TextSpan(style: TextStyle(color: Colors.black), children: spans));
//   }
// }

// new by bens
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/models/post.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
// import 'package:http/http.dart' as http;
// import 'package:hive/hive.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:pdftron_flutter/pdftron_flutter.dart';

// class pemilihankeputusan extends StatefulWidget {
//   const pemilihankeputusan({Key? key}) : super(key: key);

//   @override
//   State<pemilihankeputusan> createState() => _pemilihankeputusanState();
// }

// class _pemilihankeputusanState extends State<pemilihankeputusan> {
//   late Box _myBox;
//   List<Post> posts = [];
//   TextEditingController searchDatauser = TextEditingController();
//   List<Post> displayItem = [];
//   int lastSeenIndex = -1;

//   @override
//   void initState() {
//     super.initState();
//     _initHive();
//   }

//   void _initHive() async {
//     await Hive.initFlutter();
//     await openHiveBoxes();
//     fetchPost();
//     loadLastSeenIndex();
//   }

//   Future<void> openHiveBoxes() async {
//     await Hive.openBox('Favourite');
//     _myBox = Hive.box('Favourite');
//   }

//   void addToBookmark(int? id) {
//     if (id != null) {
//       var bookmarkData = _myBox.get('bookmark') ?? [];
//       if (!bookmarkData.contains(id)) {
//         bookmarkData.add(id);
//         _myBox.put('bookmark', bookmarkData);
//         print('Item berhasil ditambahkan ke bookmark');
//       } else {
//         print('Item sudah ada di dalam bookmark');
//       }
//     }
//   }

//   Future<void> fetchPost() async {
//     final response = await http
//         .get(Uri.parse('http://172.20.10.6:8000/api/pemilihanKeputusan'));
//     if (response.statusCode == 200) {
//       final body = response.body;
//       final json = jsonDecode(body);
//       final result = json as List<dynamic>;
//       final transform = result.map((e) {
//         return Post(
//           data_file: e['data_file'],
//           firebase_url: e['firebase_url'],
//           id: e['id'],
//           title: e['title'],
//           description: e['description'],
//         );
//       }).toList();
//       setState(() {
//         posts = transform;
//         displayItem = List.from(posts);
//       });
//     } else {
//       print('Failed to load posts');
//     }
//   }

//   void _onSearch(String searchText) {
//     searchData(searchText);
//   }

//   void searchData(String data) {
//     setState(() {
//       if (data.isEmpty) {
//         displayItem = List.from(posts);
//       } else {
//         displayItem = posts.where((post) {
//           return post.title.toLowerCase().contains(data.toLowerCase()) ||
//               post.description.toLowerCase().contains(data.toLowerCase());
//         }).toList();
//       }
//     });
//   }

//   void loadLastSeenIndex() {
//     int? savedIndex = _myBox.get('lastSeenIndex');
//     if (savedIndex != null) {
//       setState(() {
//         lastSeenIndex = savedIndex;
//       });
//     }
//   }

//   void saveLastSeenIndex(int index) {
//     _myBox.put('lastSeenIndex', index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'File Keputusan BAWASLU',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: ListView(
//         children: [
//           Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width,
//             margin: const EdgeInsets.all(20.0),
//             child: TextField(
//               controller: searchDatauser,
//               onChanged: ((value) => _onSearch(value)),
//               decoration: InputDecoration(
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 hintText: 'Cari undang-undang di sini',
//                 prefixIcon: const Icon(Icons.search),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(20.0),
//             child: buildListView(displayItem),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget buildListView(List<Post> displayItem) {
//   return SizedBox(
//     height: MediaQuery.of(context).size.height,
//     child: ListView.builder(
//       itemCount: displayItem.length,
//       itemBuilder: (context, index) {
//         final bool isLastSeen = index == lastSeenIndex;
//         return InkWell(
//           onTap: () {
//             setState(() {
//               lastSeenIndex = index;
//               saveLastSeenIndex(index);
//             });
//             Navigator.push(
//               context,
//               MaterialPageRoute(
//                 builder: (context) => Viewer(
//                   url: displayItem[index].firebase_url,
//                   searchTerm: searchDatauser.text,
//                 ),
//               ),
//             );
//           },
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               ListTile(
//                 title: _highlightText(
//                   displayItem[index].title,
//                   searchDatauser.text,
//                   searchMode: searchDatauser.text.isNotEmpty,
//                 ),
//                 leading: Container(
//                   height: 50,
//                   width: 50,
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: isLastSeen ? Color(0xFFbc9d61) : Colors.grey[300],
//                   ),
//                   child: Icon(
//                     Icons.picture_as_pdf,
//                     color: isLastSeen ? Colors.white : Colors.red,
//                     size: 28,
//                   ),
//                 ),
//                 trailing: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     IconButton(
//                       icon: _myBox.get('bookmark') != null &&
//                               _myBox.get('bookmark').contains(displayItem[index].id)
//                           ? Icon(Icons.favorite, color: Colors.red)
//                           : Icon(Icons.favorite_border),
//                       onPressed: () {
//                         setState(() {
//                           addToBookmark(displayItem[index].id);
//                         });
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//               if (searchDatauser.text.isNotEmpty) // Hanya tampilkan deskripsi saat dalam mode pencarian
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                   child: _highlightText(
//                     displayItem[index].description,
//                     searchDatauser.text,
//                     searchMode: true,
//                   ),
//                 ),
//             ],
//           ),
//         );
//       },
//     ),
//   );
// }

//   Widget _highlightText(String text, String searchTerm,
//       {bool searchMode = false}) {
//     if (!searchMode || searchTerm.isEmpty) {
//       return Text(text);
//     }

//     List<TextSpan> spans = [];
//     int start = 0;
//     int index = text.toLowerCase().indexOf(searchTerm.toLowerCase());

//     while (index != -1) {
//       if (index > start) {
//         spans.add(TextSpan(text: text.substring(start, index)));
//       }

//       spans.add(TextSpan(
//           text: text.substring(index, index + searchTerm.length),
//           style: TextStyle(backgroundColor: Colors.amber[400])));

//       start = index + searchTerm.length;
//       index = text.toLowerCase().indexOf(searchTerm.toLowerCase(), start);
//     }

//     if (start < text.length) {
//       spans.add(TextSpan(text: text.substring(start)));
//     }

//     return RichText(
//         text: TextSpan(style: TextStyle(color: Colors.black), children: spans));
//   }
// }

// last modified by bens
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/models/post.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
// import 'package:http/http.dart' as http;

// class pemilihankeputusan extends StatefulWidget {
//   const pemilihankeputusan({Key? key}) : super(key: key);

//   @override
//   State<pemilihankeputusan> createState() => _pemilihankeputusanState();
// }

// class _pemilihankeputusanState extends State<pemilihankeputusan> {
//   late List<Post> posts = [];
//   late List<Post> displayItem = [];
//   late TextEditingController searchDatauser;
//   late int lastSeenIndex;

//   @override
//   void initState() {
//     super.initState();
//     searchDatauser = TextEditingController();
//     lastSeenIndex = -1;
//     fetchPost();
//   }

//   @override
//   void dispose() {
//     searchDatauser.dispose();
//     super.dispose();
//   }

//   Future<void> fetchPost() async {
//     final response = await http.get(Uri.parse('http://172.20.10.6:8000/api/pemilihanKeputusan'));
//     if (response.statusCode == 200) {
//       final body = response.body;
//       final json = jsonDecode(body) as List<dynamic>;
//       setState(() {
//         posts = json.map((e) => Post(
//           data_file: e['data_file'],
//           firebase_url: e['firebase_url'],
//           id: e['id'],
//           title: e['title'],
//           description: e['description'],

//         )).toList();
//         displayItem = List.from(posts);
//       });
//     } else {
//       print('Failed to load posts');
//     }
//   }

//   void _onSearch(String searchText) {
//     searchData(searchText);
//   }

//   void searchData(String data) {
//     setState(() {
//       if (data.isEmpty) {
//         displayItem = List.from(posts);
//       } else {
//         displayItem = posts.where((post) {
//           return post.title.toLowerCase().contains(data.toLowerCase()) ||
//               post.description.toLowerCase().contains(data.toLowerCase());
//         }).toList();
//       }
//     });
//   }

//   void saveLastSeenIndex(int index) {
//     setState(() {
//       lastSeenIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'File Keputusan BAWASLU',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 20,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61),
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             height: 100,
//             width: MediaQuery.of(context).size.width,
//             margin: const EdgeInsets.all(20.0),
//             child: TextField(
//               controller: searchDatauser,
//               onChanged: _onSearch,
//               decoration: InputDecoration(
//                 filled: true,
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(20.0),
//                 ),
//                 hintText: 'Cari undang-undang di sini',
//                 prefixIcon: const Icon(Icons.search),
//               ),
//             ),
//           ),
//           Expanded(
//             child: ListView.builder(
//               itemCount: displayItem.length,
//               itemBuilder: (context, index) {
//                 final bool isLastSeen = index == lastSeenIndex;
//                 final post = displayItem[index];
//                 return InkWell(
//                   onTap: () {
//                     saveLastSeenIndex(index);
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => Viewer(
//                           url: post.firebase_url,
//                           searchTerm: searchDatauser.text,

//                         ),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ListTile(
//                         title: _highlightText(
//                           post.title,
//                           searchDatauser.text,
//                           searchMode: searchDatauser.text.isNotEmpty,
//                         ),
//                         leading: Container(
//                           height: 50,
//                           width: 50,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(12),
//                             color: isLastSeen ? Color(0xFFbc9d61) : Colors.grey[300],
//                           ),
//                           child: Icon(
//                             Icons.picture_as_pdf,
//                             color: isLastSeen ? Colors.white : Colors.red,
//                             size: 28,
//                           ),
//                         ),
//                         trailing: IconButton(
//                           icon: Icon(Icons.favorite_border),
//                           onPressed: () {
//                             // Implement your logic for adding to bookmark
//                           },
//                         ),
//                       ),
//                       if (searchDatauser.text.isNotEmpty)
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                           child: ListView(
//                             shrinkWrap: true,
//                             physics: NeverScrollableScrollPhysics(),
//                             children: _extractHighlightedTexts(
//                               post.description,
//                               searchDatauser.text,
//                             ).map((highlight) {
//                               return Card(
//                                 elevation: 2,
//                                 margin: const EdgeInsets.symmetric(vertical: 8.0),
//                                 child: InkWell(
//                                   onTap: () {
//                                     Navigator.push(
//                                       context,
//                                       MaterialPageRoute(
//                                         builder: (context) => Viewer(
//                                           url: post.firebase_url,
//                                           searchTerm: searchDatauser.text,

//                                         ),
//                                       ),
//                                     );
//                                   },
//                                   child: Padding(
//                                     padding: const EdgeInsets.all(12.0),
//                                     child: _highlightText(
//                                       highlight,
//                                       searchDatauser.text,
//                                       searchMode: true,
//                                     ),
//                                   ),
//                                 ),
//                               );
//                             }).toList(),
//                           ),
//                         ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   List<String> _extractHighlightedTexts(String description, String searchTerm) {
//     final words = description.split(' ');
//     final List<String> highlights = [];
//     final searchTermLower = searchTerm.toLowerCase();

//     for (int i = 0; i < words.length; i++) {
//       if (words[i].toLowerCase().contains(searchTermLower)) {
//         int start = (i - 5).clamp(0, words.length);
//         int end = (i + 5).clamp(0, words.length);
//         highlights.add(words.sublist(start, end).join(' '));
//       }
//     }
//     return highlights;
//   }

//   Widget _highlightText(String text, String searchTerm, {bool searchMode = false}) {
//     if (!searchMode || searchTerm.isEmpty) {
//       return Text(text);
//     }

//     List<TextSpan> spans = [];
//     int start = 0;
//     int index = text.toLowerCase().indexOf(searchTerm.toLowerCase());

//     while (index != -1) {
//       if (index > start) {
//         spans.add(TextSpan(text: text.substring(start, index)));
//       }

//       spans.add(TextSpan(
//           text: text.substring(index, index + searchTerm.length),
//           style: TextStyle(backgroundColor: Colors.amber[400])));

//       start = index + searchTerm.length;
//       index = text.toLowerCase().indexOf(searchTerm.toLowerCase(), start);
//     }

//     if (start < text.length) {
//       spans.add(TextSpan(text: text.substring(start)));
//     }

//     return RichText(
//       text: TextSpan(style: TextStyle(color: Colors.black), children: spans),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/models/post.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
import 'package:http/http.dart' as http;

class pemilihankeputusan extends StatefulWidget {
  const pemilihankeputusan({Key? key}) : super(key: key);

  @override
  State<pemilihankeputusan> createState() => _pemilihankeputusanState();
}

class _pemilihankeputusanState extends State<pemilihankeputusan> {
  late List<Post> posts = [];
  late List<Post> displayItem = [];
  late TextEditingController searchDatauser;
  late int lastSeenIndex;

  @override
  void initState() {
    super.initState();
    searchDatauser = TextEditingController();
    lastSeenIndex = -1;
    fetchPost();
  }

  @override
  void dispose() {
    searchDatauser.dispose();
    super.dispose();
  }

  Future<void> fetchPost() async {
    final response = await http
        .get(Uri.parse('http://172.20.10.6:8000/api/pemilihanKeputusan'));
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body) as List<dynamic>;
      setState(() {
        posts = json.map((e) => Post.fromJson(e)).toList();
        displayItem = List.from(posts);
      });
    } else {
      print('Failed to load posts');
    }
  }

  void _onSearch(String searchText) {
    searchData(searchText);
  }

  void searchData(String data) {
    setState(() {
      if (data.isEmpty) {
        displayItem = List.from(posts);
      } else {
        displayItem = posts.where((post) {
          final inputPasalMatches = post.inputPasal.any((pasal) {
            return pasal.isi.toLowerCase().contains(data.toLowerCase()) ||
                pasal.pasal.toLowerCase().contains(data.toLowerCase()) ||
                pasal.halaman.toLowerCase().contains(data.toLowerCase());
          });
          return post.title.toLowerCase().contains(data.toLowerCase()) ||
              post.description.toLowerCase().contains(data.toLowerCase()) ||
              inputPasalMatches;
        }).toList();
      }
    });
  }

  void saveLastSeenIndex(int index) {
    setState(() {
      lastSeenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'File Keputusan BAWASLU',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFbc9d61),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(20.0),
            child: TextField(
              controller: searchDatauser,
              onChanged: _onSearch,
              decoration: InputDecoration(
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                hintText: 'Cari undang-undang di sini',
                prefixIcon: const Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: displayItem.length,
              itemBuilder: (context, index) {
                final bool isLastSeen = index == lastSeenIndex;
                final post = displayItem[index];
                return InkWell(
                  onTap: () {
                    saveLastSeenIndex(index);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Viewer(
                          url: post.firebase_url,
                          searchTerm: searchDatauser.text,
                        ),
                      ),
                    );
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        title: _highlightText(
                          post.title,
                          searchDatauser.text,
                          searchMode: searchDatauser.text.isNotEmpty,
                        ),
                        leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: isLastSeen
                                ? Color(0xFFbc9d61)
                                : Colors.grey[300],
                          ),
                          child: Icon(
                            Icons.picture_as_pdf,
                            color: isLastSeen ? Colors.white : Colors.red,
                            size: 28,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(Icons.favorite_border),
                          onPressed: () {
                            // Implement your logic for adding to bookmark
                          },
                        ),
                      ),
                      if (searchDatauser.text.isNotEmpty)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: post.inputPasal.where((pasal) {
                              return pasal.isi.toLowerCase().contains(
                                      searchDatauser.text.toLowerCase()) ||
                                  pasal.pasal.toLowerCase().contains(
                                      searchDatauser.text.toLowerCase()) ||
                                  pasal.halaman.toLowerCase().contains(
                                      searchDatauser.text.toLowerCase());
                            }).map((pasal) {
                              return Card(
                                elevation: 2,
                                margin:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Viewer(
                                          url: post.firebase_url,
                                          searchTerm: searchDatauser.text,
                                        ),
                                      ),
                                    );
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        _highlightText(
                                            pasal.pasal, searchDatauser.text,
                                            searchMode: true),
                                        _highlightText(
                                            pasal.halaman, searchDatauser.text,
                                            searchMode: true),
                                        _highlightText(
                                            pasal.isi, searchDatauser.text,
                                            searchMode: true),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  List<String> _extractHighlightedTexts(String description, String searchTerm) {
    final words = description.split(' ');
    final List<String> highlights = [];
    final searchTermLower = searchTerm.toLowerCase();

    for (int i = 0; i < words.length; i++) {
      if (words[i].toLowerCase().contains(searchTermLower)) {
        int start = (i - 5).clamp(0, words.length);
        int end = (i + 5).clamp(0, words.length);
        highlights.add(words.sublist(start, end).join(' '));
      }
    }
    return highlights;
  }

  Widget _highlightText(String text, String searchTerm,
      {bool searchMode = false}) {
    if (!searchMode || searchTerm.isEmpty) {
      return Text(text);
    }

    List<TextSpan> spans = [];
    int start = 0;
    int index = text.toLowerCase().indexOf(searchTerm.toLowerCase());

    while (index != -1) {
      if (index > start) {
        spans.add(TextSpan(text: text.substring(start, index)));
      }

      spans.add(TextSpan(
          text: text.substring(index, index + searchTerm.length),
          style: TextStyle(backgroundColor: Colors.amber[400])));

      start = index + searchTerm.length;
      index = text.toLowerCase().indexOf(searchTerm.toLowerCase(), start);
    }

    if (start < text.length) {
      spans.add(TextSpan(text: text.substring(start)));
    }

    return RichText(
      text: TextSpan(style: TextStyle(color: Colors.black), children: spans),
    );
  }
}
