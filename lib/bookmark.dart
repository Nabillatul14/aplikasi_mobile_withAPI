import 'dart:io';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class bookmark extends StatelessWidget{
  // bookmark._private();
  // static final bookmark instance = bookmark._private();
  late Database _db;

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

  Future<void> closeDB() async {
    await _db.close();
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
      backgroundColor: Colors.white,
    );
  }
}
