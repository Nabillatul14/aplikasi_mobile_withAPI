// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) => List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  Post({
    required this.data_file,
    required this.id,
    required this.title,
    // this.body,
  });

  String data_file; 
  int id;
  String title;
  // String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        data_file: json["data_file"],
        id: json["id"],
        title: json["title"],
        // body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "data_file": data_file,
        "id": id,
        "title": title,
        // "body": body,
      };
}