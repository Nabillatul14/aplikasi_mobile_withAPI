import 'dart:convert';
import 'package:flutter_api_bawaslu/models/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_api_bawaslu/views/pdfviewpemilihankeputusan.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
        title: const Text(
          'Rest API Call',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
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
                  hintText: 'Masukan Nama yang dicari',
                  prefixIcon: const Icon(Icons.search)),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(20.0),
              child: (searchDatauser.text == '')
                  ? SizedBox(
                      height: MediaQuery.of(context).size.height,
                      child: ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          // final email = datauser.email;
                          return InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PDFViewerFromUrl(
                                          url:
                                              'http://172.20.10.6:8000/storage/${posts![index].data_file}')),
                                );
                              },
                              child: ListTile(
                                title: Text(posts[index].title),
                              
                                // subtitle: Text(posts[index].data_file),
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
                          return ListTile(
                            title: Text(displayItem[index].title),
                            subtitle: Text(displayItem[index].data_file),
                          );
                        },
                      ),
                    ))
        ],
      ),
    );
  }

  void fetchPost() async {
    final response = await http
        .get(Uri.parse('http://172.20.10.6:8000/api/pemilihanKeputusan'));
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

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   List<Post> posts = [];
//   late List<Post> displayItem = [];

//   TextEditingController searchDatauser = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     fetchPost();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Rest API Call',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
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
//                   hintText: 'Masukan Nama yang dicari',
//                   prefixIcon: const Icon(Icons.search)),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.all(20.0),
//             child: displayItem.isEmpty
//                 ? const Center(
//                     child: Text('Tidak ada hasil pencarian'),
//                   )
//                 : SizedBox(
//                     height: MediaQuery.of(context).size.height,
//                     child: ListView.builder(
//                       itemCount: displayItem.length,
//                       itemBuilder: (context, index) {
//                         return ListTile(
//                           title: Text(displayItem[index].title),
//                           subtitle: Text(displayItem[index].data_file),
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
//     final response =
//         await http.get(Uri.parse('http://172.20.10.6:8000/api/pemilihanKeputusan'));
//     final body = response.body;
//     final json = jsonDecode(body);
//     final result = json as List<dynamic>;
//     final transform = result.map((e) {
//       return Post(
//         data_file: e['data_file'],
//         id: e['id'],
//         title: e['title'],
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
//     print('Hasil pencarian: $displayItem');
//   }
// }
