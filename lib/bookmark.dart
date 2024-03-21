// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

// class bookmark extends StatelessWidget{
//   bookmark._private();
//   static final bookmark instance = bookmark._private();
//   late Database _db;

//   Future<Database> get db async {
//     if (_db.isOpen) {
//       return _db;
//     } else {
//       _db = await _initDB();
//       return _db;
//     }
//   }

//   Future _initDB() async {
//     Directory docDir = await getApplicationDocumentsDirectory();
//     String path = join(docDir.path, "bookmark.db");
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (database, version) async {
//         await database.execute(
//           '''
//           CREATE TABLE bookmarks(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             title TEXT NOT NULL,
//             page_index INTEGER DEFAULT 0
//           )
//           ''',
//         );
//       },
//     );
//   }

//   Future<void> closeDB() async {
//     await _db.close();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Bookmark',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 25,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61),
//       ),
//       backgroundColor: Colors.white,
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

// class BookmarkScreen extends StatelessWidget {
//   BookmarkScreen._private();
//   static BookmarkScreen _instance = BookmarkScreen._(); // Deklarasi _instance sebagai static field
//   late Database _db;

//     // Private constructor
//   BookmarkScreen._();

//   // Getter untuk mengakses _instance
//   static BookmarkScreen get instance => _instance;

//   Future<Database> get db async {
//     if (_db.isOpen) {
//       return _db;
//     } else {
//       _db = await _initDB();
//       return _db;
//     }
//   }

//   Future _initDB() async {
//     Directory docDir = await getApplicationDocumentsDirectory();
//     String path = join(docDir.path, "bookmark.db");
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (database, version) async {
//         await database.execute(
//           '''
//           CREATE TABLE bookmarks(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             title TEXT NOT NULL,
//             page_index INTEGER DEFAULT 0
//           )
//           ''',
//         );
//       },
//     );
//   }

//   Future<List<Map<String, dynamic>>> getBookmarks() async {
//     Database db = await instance.db;
//     return await db.query("bookmarks");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Bookmark',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 25,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61),
//       ),
//       body: FutureBuilder(
//         future: getBookmarks(),
//         builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('Bookmark kosong'));
//           }
//           // Tampilkan daftar bookmark di sini, misalnya menggunakan ListView.builder
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               // Buat widget untuk menampilkan setiap bookmark
//               // Misalnya, title dan tombol untuk menghapus bookmark
//               return ListTile(
//                 title: Text(snapshot.data![index]['title']),
//                 // Tambahkan tombol atau tindakan lain sesuai kebutuhan
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:path/path.dart';

// class BookmarkScreen extends StatelessWidget {
//   BookmarkScreen._private();
//   static BookmarkScreen _instance = BookmarkScreen._private();
//   late Database _db;

//   BookmarkScreen._();

//   static BookmarkScreen get instance => _instance;

//   Future<Database> get db async {
//     if (_db.isOpen) {
//       return _db;
//     } else {
//       _db = await _initDB();
//       return _db;
//     }
//   }

//   Future _initDB() async {
//     Directory docDir = await getApplicationDocumentsDirectory();
//     String path = join(docDir.path, "bookmark.db");
//     return await openDatabase(
//       path,
//       version: 1,
//       onCreate: (database, version) async {
//         await database.execute(
//           '''
//           CREATE TABLE bookmarks(
//             id INTEGER PRIMARY KEY AUTOINCREMENT,
//             title TEXT NOT NULL,
//             page_index INTEGER DEFAULT 0
//           )
//           ''',
//         );
//       },
//     );
//   }

//   Future<List<Map<String, dynamic>>> getBookmarks() async {
//     Database db = await instance.db;
//     return await db.query("bookmarks");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           'Bookmark',
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 25,
//           ),
//         ),
//         centerTitle: true,
//         backgroundColor: Color(0xFFbc9d61),
//       ),
//       body: FutureBuilder(
//         future: getBookmarks(),
//         builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Center(child: Text('Error: ${snapshot.error}'));
//           }
//           if (!snapshot.hasData || snapshot.data!.isEmpty) {
//             return Center(child: Text('Bookmark kosong'));
//           }
//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (context, index) {
//               return ListTile(
//                 title: Text(snapshot.data![index]['title']),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }

import 'dart:convert';
import 'package:flutter_api_bawaslu/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api_bawaslu/provider/simpan.dart';
import 'package:flutter_api_bawaslu/simpan_bookmark.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

class BookmarkScreen extends StatefulWidget {
  const BookmarkScreen({super.key});

  @override
  State<BookmarkScreen> createState() => _BookmarkScreenState();
}

class _BookmarkScreenState extends State<BookmarkScreen> {
  final _myBox = Hive.box('Favourite');

  void writeData(int value) {
    var bookmarkData = _myBox.get('bookmark');
    List<int> exist = <int>[]; // Inisialisasi list dengan tipe int
    if (bookmarkData != null) {
      if (bookmarkData is List<dynamic>) {
        exist = bookmarkData
            .cast<int>()
            .toList(); // Konversi List<dynamic> menjadi List<int>
      } else if (bookmarkData is List<int>) {
        exist = bookmarkData; // Gunakan langsung jika sudah bertipe List<int>
      }
    }
    exist.add(value);
    _myBox.put('bookmark', exist);
    print(_myBox.get('bookmark'));
  }

  void removeFromBookmark(int id) {
    var bookmarkData = _myBox.get('bookmark') ?? [];
    if (bookmarkData.contains(id)) {
      bookmarkData.remove(id); // Hapus ID dari data bookmark
      _myBox.put('bookmark', bookmarkData); // Update data bookmark
      print('Item berhasil dihapus dari bookmark');
    } else {
      print('Item tidak ditemukan di dalam bookmark');
    }
  }

  // list get data api
  List<Post> posts = [];

  // text editing search
  TextEditingController searchDatauser = TextEditingController();

  // list display
  late List<Post> displayItem = List.from(posts);

  @override
  void initState() {
    super.initState();
    fetchPost();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('File Keputusan BAWASLU',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 25)),
        centerTitle: true,
        backgroundColor: Color(0xFFbc9d61),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
            height: 100,
            width: MediaQuery.of(context).size.width,
            margin: const EdgeInsets.all(20.0),
            child: TextField(
              controller: searchDatauser,
              onChanged: ((value) => searchData(value)),
              decoration: InputDecoration(
                  filled: true,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  hintText: 'Cari undang-undang / pasal di sini',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20.0),
              child: (searchDatauser.text == '')
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: displayItem.length,
                        itemBuilder: (context, index) {
                          // final email = datauser.email;
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PDFViewerFromUrl(
                                          url:
                                              'http://192.168.0.191:8000/storage/${displayItem![index].data_file}')),
                                );
                              },
                              child: ListTile(
                                title: Text(displayItem[index].title),
                                leading: Container(
                                  height: 50,
                                  width: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: Colors.grey[300],
                                  ),
                                  child: Icon(
                                    Icons.picture_as_pdf,
                                    color: Colors.red,
                                    size: 28,
                                  ),
                                ),
                                // trailing: IconButton(
                                //   icon: Icon(Icons.favorite),
                                //   onPressed: () {
                                //     writeData(displayItem[index].id);
                                //   },
                                // ),
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    removeFromBookmark(displayItem[index].id);
                                    setState(() {
                                      displayItem.removeAt(
                                          index); // Hapus item dari daftar tampilan
                                    });
                                  },
                                ),
                              ));
                        },
                      ),
                    )
                  : SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: displayItem.length,
                        itemBuilder: (context, index) {
                          // final email = datauser.email;
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PDFViewerFromUrl(
                                          url:
                                              'http://192.168.0.191:8000/storage/${displayItem![index].data_file}')),
                                );
                                print("test");
                              },
                              child: ListTile(
                                title: Text(displayItem[index].title),

                                // subtitle: Text(posts[index].data_file),
                              ));
                        },
                      ),
                    ))
        ],
      ),
    );
  }

  void fetchPost() async {
    var bookmarkData = _myBox.get('bookmark') ?? []; // Ambil data bookmark
    final response =
        await http.get(Uri.parse('http://192.168.0.191:8000/api/dashboard'));
    final body = response.body;
    final json = jsonDecode(body);
    final result = json as List<dynamic>;

    // Filter data berdasarkan ID yang ada dalam data bookmark
    final transform = result
        .where((e) => bookmarkData
            .contains(e['id'])) // Cek apakah ID ada dalam data bookmark
        .map((e) {
      return Post(
        data_file: e['data_file'],
        id: e['id'],
        title: e['title'],
      );
    }).toList();
    setState(() {
      posts = transform;
      displayItem = List.from(posts);
    });
    print('');
  }

  void searchData(String data) {
    setState(() {
      displayItem = posts
          .where(
              (value) => value.title.toLowerCase().contains(data.toLowerCase()))
          .toList();
    });
  }
}
