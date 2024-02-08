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

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class BookmarkScreen extends StatelessWidget {
  BookmarkScreen._private();
  static BookmarkScreen _instance = BookmarkScreen._private();
  late Database _db;

  BookmarkScreen._();

  static BookmarkScreen get instance => _instance;

  Future<Database> get db async {
    if (_db.isOpen) {
      return _db;
    } else {
      _db = await _initDB();
      return _db;
    }
  }

  Future _initDB() async {
    Directory docDir = await getApplicationDocumentsDirectory();
    String path = join(docDir.path, "bookmark.db");
    return await openDatabase(
      path,
      version: 1,
      onCreate: (database, version) async {
        await database.execute(
          '''
          CREATE TABLE bookmarks(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            title TEXT NOT NULL,
            page_index INTEGER DEFAULT 0
          )
          ''',
        );
      },
    );
  }

  Future<List<Map<String, dynamic>>> getBookmarks() async {
    Database db = await instance.db;
    return await db.query("bookmarks");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Bookmark',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color(0xFFbc9d61),
      ),
      body: FutureBuilder(
        future: getBookmarks(),
        builder: (context, AsyncSnapshot<List<Map<String, dynamic>>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text('Bookmark kosong'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index]['title']),
              );
            },
          );
        },
      ),
    );
  }
}


