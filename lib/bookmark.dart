// import 'dart:convert';
// import 'package:flutter_api_bawaslu/models/post.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_api_bawaslu/provider/simpan.dart';
// import 'package:provider/provider.dart';
// import 'package:hive/hive.dart';

// class BookmarkScreen extends StatefulWidget {
//   const BookmarkScreen({super.key});

//   @override
//   State<BookmarkScreen> createState() => _BookmarkScreenState();
// }

// class _BookmarkScreenState extends State<BookmarkScreen> {
//   final _myBox = Hive.box('Favourite');

//   void writeData(int value) {
//     var bookmarkData = _myBox.get('bookmark');
//     List<int> exist = <int>[]; // Inisialisasi list dengan tipe int
//     if (bookmarkData != null) {
//       if (bookmarkData is List<dynamic>) {
//         exist = bookmarkData
//             .cast<int>()
//             .toList(); // Konversi List<dynamic> menjadi List<int>
//       } else if (bookmarkData is List<int>) {
//         exist = bookmarkData; // Gunakan langsung jika sudah bertipe List<int>
//       }
//     }
//     exist.add(value);
//     _myBox.put('bookmark', exist);
//     print(_myBox.get('bookmark'));
//   }

//   void removeFromBookmark(int id) {
//     var bookmarkData = _myBox.get('bookmark') ?? [];
//     if (bookmarkData.contains(id)) {
//       bookmarkData.remove(id); // Hapus ID dari data bookmark
//       _myBox.put('bookmark', bookmarkData); // Update data bookmark
//       print('Item berhasil dihapus dari bookmark');
//     } else {
//       print('Item tidak ditemukan di dalam bookmark');
//     }
//   }

//   // list get data api
//   List<Post> posts = [];

//   // text editing search
//   TextEditingController searchDatauser = TextEditingController();

//   // list display
//   late List<Post> displayItem = List.from(posts);

//   @override
//   void initState() {
//     super.initState();
//     fetchPost();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Bookmark',
//             style: TextStyle(
//                 color: Colors.white,
//                 fontWeight: FontWeight.bold,
//                 fontSize: 25)),
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
//                   filled: true,
//                   border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(20.0)),
//                   hintText: 'Cari undang-undang / pasal di sini',
//                   prefixIcon: const Icon(Icons.search)),
//             ),
//           ),
//           Container(
//               padding: const EdgeInsets.all(20.0),
//               child: (searchDatauser.text == '')
//                   ? SizedBox(
//                       height: MediaQuery.of(context).size.height,
//                       child: ListView.builder(
//                         itemCount: displayItem.length,
//                         itemBuilder: (context, index) {
//                           // final email = datauser.email;
//                           return InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Viewer(
//                                           url:
//                                               'http://192.168.18.150:8000/storage/${displayItem![index].data_file}')),
//                                 );
//                               },
//                               child: ListTile(
//                                 title: Text(displayItem[index].title),
//                                 leading: Container(
//                                   height: 50,
//                                   width: 50,
//                                   decoration: BoxDecoration(
//                                     borderRadius: BorderRadius.circular(12),
//                                     color: Colors.grey[300],
//                                   ),
//                                   child: Icon(
//                                     Icons.picture_as_pdf,
//                                     color: Colors.red,
//                                     size: 28,
//                                   ),
//                                 ),
//                                 // trailing: IconButton(
//                                 //   icon: Icon(Icons.favorite),
//                                 //   onPressed: () {
//                                 //     writeData(displayItem[index].id);
//                                 //   },
//                                 // ),
//                                 trailing: IconButton(
//                                   icon: Icon(Icons.delete),
//                                   onPressed: () {
//                                     removeFromBookmark(displayItem[index].id);
//                                     setState(() {
//                                       displayItem.removeAt(
//                                           index); // Hapus item dari daftar tampilan
//                                     });
//                                   },
//                                 ),
//                               ));
//                         },
//                       ),
//                     )
//                   : SizedBox(
//                       height: MediaQuery.of(context).size.height,
//                       child: ListView.builder(
//                         itemCount: displayItem.length,
//                         itemBuilder: (context, index) {
//                           // final email = datauser.email;
//                           return InkWell(
//                               onTap: () {
//                                 Navigator.push(
//                                   context,
//                                   MaterialPageRoute(
//                                       builder: (context) => Viewer(
//                                           url:
//                                               'http://10.219.39.206:8000/storage/${displayItem![index].data_file}')),
//                                 );
//                                 print("test");
//                               },
//                               child: ListTile(
//                                 title: Text(displayItem[index].title),

//                                 // subtitle: Text(posts[index].data_file),
//                               ));
//                         },
//                       ),
//                     ))
//         ],
//       ),
//     );
//   }

//   void fetchPost() async {
//     var bookmarkData = _myBox.get('bookmark') ?? []; // Ambil data bookmark
//     final response =
//         await http.get(Uri.parse('http://192.168.18.150:8000/api/dashboard'));
//     final body = response.body;
//     final json = jsonDecode(body);
//     final result = json as List<dynamic>;

//     // Filter data berdasarkan ID yang ada dalam data bookmark
//     final transform = result
//         .where((e) => bookmarkData
//             .contains(e['id'])) // Cek apakah ID ada dalam data bookmark
//         .map((e) {
//        return Post(
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
//     print('');
//   }

//   void searchData(String data) {
//     setState(() {
//       displayItem = posts
//           .where(
//               (value) => value.title.toLowerCase().contains(data.toLowerCase()))
//           .toList();
//     });
//   }
// }

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/models/post.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
import 'package:http/http.dart' as http;
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

  List<Post> posts = [];
  TextEditingController searchDatauser = TextEditingController();
  late List<Post> displayItem = List.from(posts);

  @override
  void initState() {
    super.initState();
    fetchBookmarkedPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bookmark',
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
                          return InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Viewer(
                                //           url:
                                //               'http://172.20.10.6:8000/storage/${displayItem[index].data_file}',
                                //           searchTerm: searchDatauser.text)),
                                // );
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
                                trailing: IconButton(
                                  icon: Icon(Icons.delete),
                                  onPressed: () {
                                    removeFromBookmark(displayItem[index].id);
                                    setState(() {
                                      displayItem.removeAt(index);
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
                          return InkWell(
                              onTap: () {
                                // Navigator.push(
                                //   context,
                                //   MaterialPageRoute(
                                //       builder: (context) => Viewer(
                                //             url:
                                //                 'http://172.20.10.6:80000/storage/${displayItem[index].data_file}',
                                //             searchTerm: searchDatauser.text,
                                //             page: int.parse(pasal.halaman),
                                //           )),
                                // );
                              },
                              child: ListTile(
                                title: Text(displayItem[index].title),
                              ));
                        },
                      ),
                    ))
        ],
      ),
    );
  }

  // void fetchPost() async {
  //   var bookmarkData = _myBox.get('bookmark') ?? [];
  //   final response =
  //       await http.get(Uri.parse('http://172.20.10.6:8000/api/dashboard'));
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   final result = json as List<dynamic>;

  //   final transform = result
  //       .where((e) => bookmarkData.contains(e['id']))
  //       .map((e) {
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
  //   print('');
  // }

  // Future<void> fetchPost() async {
  //   final response = await http
  //       .get(Uri.parse('http://192.168.1.16:8000/api/pemilihanKeputusan'));
  //   if (response.statusCode == 200) {
  //     final body = response.body;
  //     final json = jsonDecode(body) as List<dynamic>;
  //     setState(() {
  //       posts = json.map((e) => Post.fromJson(e)).toList();
  //       displayItem = List.from(posts);
  //     });
  //   } else {
  //     print('Failed to load posts');
  //   }
  // }

   Future<void> fetchBookmarkedPosts() async {
    var bookmarkData = _myBox.get('bookmark') ?? [];
    final response = await http.get(Uri.parse('http://172.20.10.6:8000/api/pemilihanKeputusan'));
    if (response.statusCode == 200) {
      final body = response.body;
      final json = jsonDecode(body) as List<dynamic>;
      final allPosts = json.map((e) => Post.fromJson(e)).toList();
      setState(() {
        posts = allPosts.where((post) => bookmarkData.contains(post.id)).toList();
        displayItem = List.from(posts);
      });
    } else {
      print('Failed to load posts');
    }
  }

  // void searchData(String data) {
  //   setState(() {
  //     displayItem = posts
  //         .where(
  //             (value) => value.title.toLowerCase().contains(data.toLowerCase()))
  //         .toList();
  //   });
  // }

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
}
