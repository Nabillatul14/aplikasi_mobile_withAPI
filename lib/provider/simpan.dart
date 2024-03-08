// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_api_bawaslu/simpan_bookmark.dart';


// class simpanbookmark extends ChangeNotifier {
//   List<String> _words = [];
//   List<String> get words => _words;

//   void toggleFavorite(String word) {
//     final isExist = _words.contains(word);
//     if (isExist) {
//       _words.remove(word);
//     } else {
//       _words.add(word);
//     }
//     notifyListeners();
//   }

//   bool isExist(String word) {
//     final isExist = _words.contains(word);
//     return isExist;
//   }

//   void clearFavorite() {
//     _words = [];
//     notifyListeners();
//   }

//   static simpanbookmark of(
//     BuildContext context, {
//     bool listen = true,
//   }) {
//     return Provider.of<simpanbookmark>(
//       context,
//       listen: listen,
//     );
//   }
// }

// class simpanbookmark extends ChangeNotifier {
//   Set<int> _favorites = {};

//   Set<int> get favorites => _favorites;

//   void toggleFavorite(int postId) {
//     if (_favorites.contains(postId)) {
//       _favorites.remove(postId);
//     } else {
//       _favorites.add(postId);
//     }
//     notifyListeners();
//   }

//   bool isFavorite(int postId) {
//     return _favorites.contains(postId);
//   }
// }

// class FavoritePost {
//   final int id;
//   final String title;
//   final String dataFile;

//   FavoritePost({
//     required this.id,
//     required this.title,
//     required this.dataFile,
//   });
// }
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// Define the Post class
class PostModel {
  final int id;
  final String title;
  final String dataFile;
  bool isFavorite; // New field to track favorite status

  PostModel({
    required this.id,
    required this.title,
    required this.dataFile,
    this.isFavorite = false, // Default value for isFavorite is false
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json["id"],
        title: json["title"],
        dataFile: json["data_file"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "data_file": dataFile,
      };
}

// Modify the simpanbookmark class to work with PostModel instead of int
class SimpanBookmark extends ChangeNotifier {
  Set<int> _favorites = {};
  late List<PostModel> _posts;

  SimpanBookmark(List<PostModel> posts) {
    _posts = posts;
  }

  Set<int> get favorites => _favorites;

  void toggleFavorite(int postId) {
    if (_favorites.contains(postId)) {
      _favorites.remove(postId);
    } else {
      _favorites.add(postId);
    }
    // Update the favorite status of the corresponding PostModel object
    _posts.firstWhere((post) => post.id == postId).isFavorite =
        _favorites.contains(postId);
    notifyListeners();
  }

  bool isFavorite(int postId) {
    return _favorites.contains(postId);
  }

  List<PostModel> get posts => _posts;
}

// Example of how to use this provider in your app
void main() {
  List<PostModel> posts = postFromJson('[{"id":1,"title":"Post 1","data_file":"data1.txt"},{"id":2,"title":"Post 2","data_file":"data2.txt"}]');
  
  runApp(
    ChangeNotifierProvider(
      create: (context) => SimpanBookmark(posts),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Posts'),
        ),
        body: PostList(),
      ),
    );
  }
}

class PostList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final simpanBookmark = Provider.of<SimpanBookmark>(context);
    final posts = simpanBookmark.posts;

    return ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        final post = posts[index];
        return ListTile(
          title: Text(post.title),
          trailing: IconButton(
            icon: Icon(
              post.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: post.isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              simpanBookmark.toggleFavorite(post.id);
            },
          ),
        );
      },
    );
  }
}

// Functions for serialization/deserialization of PostModel objects
List<PostModel> postFromJson(String str) =>
    List<PostModel>.from(json.decode(str).map((x) => PostModel.fromJson(x)));

String postToJson(List<PostModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
