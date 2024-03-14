import 'dart:convert';
import 'package:flutter_api_bawaslu/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_api_bawaslu/provider/simpan.dart';
import 'package:flutter_api_bawaslu/simpan_bookmark.dart';
import 'package:provider/provider.dart';
import 'package:hive/hive.dart';

class pemilihankeputusan extends StatefulWidget {
  const pemilihankeputusan({super.key});

  @override
  State<pemilihankeputusan> createState() => _pemilihankeputusanState();
}

class _pemilihankeputusanState extends State<pemilihankeputusan> {
  final _myBox = Hive.box('Favourite');

  // void writeData(int value) {
  //   // List<int> exist = _myBox.get('bookmark');
  //   List<int> exist = List.from(_myBox.get('bookmark') ?? []);
  //   _myBox.put('bookmark', exist.add(value));
  //   print(_myBox.get('bookmark'));
  // }

  // void writeData(value) {
  //   List exist = List.from(_myBox.get('bookmark') ?? []);
  //   exist.add(value);
  //   _myBox.put('bookmark', exist);
  //   print(_myBox.get('bookmark'));
  // }

  // void writeData(int value) {
  //   List<int> exist = List.from(_myBox.get('bookmark') ?? []);
  //   exist.add(value);
  //   _myBox.put('bookmark', exist); // Pastikan exist adalah List, bukan int
  //   print(_myBox.get('bookmark'));
  // }

  // void writeData(int value) {
  //   var bookmarkData = _myBox.get('bookmark');
  //   List<int> exist = <int>[]; // Inisialisasi list dengan tipe int
  //   if (bookmarkData != null) {
  //     if (bookmarkData is List<dynamic>) {
  //       exist = bookmarkData
  //           .cast<int>()
  //           .toList(); // Konversi List<dynamic> menjadi List<int>
  //     } else if (bookmarkData is List<int>) {
  //       exist = bookmarkData; // Gunakan langsung jika sudah bertipe List<int>
  //     }
  //   }
  //   exist.add(value);
  //   _myBox.put('bookmark', exist);
  //   print(_myBox.get('bookmark'));
  // }

  void addToBookmark(int id) {
    var bookmarkData = _myBox.get('bookmark') ?? [];
    if (!bookmarkData.contains(id)) {
      bookmarkData.add(id);
      _myBox.put('bookmark', bookmarkData);
      print('Item berhasil ditambahkan ke bookmark');
    } else {
      print('Item sudah ada di dalam bookmark');
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
                                              'http://192.168.68.115:8000/storage/${displayItem![index].data_file}')),
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
                                //   icon: Icon(
                                //     Icons.favorite_border,
                                //     color: Colors.red,
                                //   ),
                                //   onPressed: () {
                                //     print(displayItem[index].id);
                                //     // List exist = List.from(_myBox.get('bookmark') ?? []);
                                //     // var exist = _myBox.get('bookmark') ?? [];
                                //     var exist = _myBox.get('bookmark') as List<int>? ?? [];
                                //     exist.add(displayItem[index].id);
                                //     _myBox.put('bookmark', exist); // Pastikan exist adalah List, bukan int
                                //     print(_myBox.get('bookmark'));
                                //   },
                                // ),

                                // trailing: IconButton(
                                //   icon: Icon(
                                //     Icons.favorite_border,
                                //     color: Colors.red,
                                //   ),
                                //   onPressed: () {
                                //     print(displayItem[index].id);
                                //     var exist =
                                //         _myBox.get('bookmark') as List<int>? ??
                                //             [];
                                //     exist.add(displayItem[index].id);
                                //     _myBox.put('bookmark',
                                //         exist); // Pastikan exist adalah List<int>, bukan List<dynamic>
                                //     print(_myBox.get('bookmark'));
                                //   },
                                // ),
                                trailing: IconButton(
                                  icon: Icon(
                                    Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    addToBookmark(displayItem[index].id);
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
                                              'http://192.168.68.115:8000/storage/${displayItem![index].data_file}')),
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
    final response = await http
        .get(Uri.parse('http://192.168.68.115:8000/api/pemilihanKeputusan'));
    final body = response.body;
    final json = jsonDecode(body);
    final result = json as List<dynamic>;
    final transform = result.map((e) {
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

