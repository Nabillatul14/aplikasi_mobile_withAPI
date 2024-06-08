// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

String postToJson(List<Post> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Post {
  bool isRead;
  bool isFavorite;
  Post({
    required this.data_file,
    required this.id,
    required this.title,
    required this.description,
    required this.firebase_url,
    this.isRead = false,
    this.isFavorite = false,
  });

  String data_file;
  String firebase_url;
  int id;
  String title;
  String description;
  // String? body;

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        data_file: json["data_file"],
        firebase_url: json["firebase_url"],
        id: json["id"],
        title: json["title"],
        description: json["description"],
        // body: json["body"],
      );

  Map<String, dynamic> toJson() => {
        "data_file": data_file,
        "firebase_url": firebase_url,
        "id": id,
        "title": title,
        "description": description,
        // "body": body,
      };
}

// import 'dart:convert';

// // Fungsi untuk menguraikan data JSON
// List<Post> postFromJson(String str) =>
//     List<Post>.from(json.decode(str).map((x) => Post.fromJson(x)));

// String postToJson(List<Post> data) =>
//     json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

// class Post {
//   bool isRead;
//   bool isFavorite;
//   int id;
//   int postfileId;
//   String dataFile;
//   String title;
//   String description;
//   String firebaseUrl;
//   String? pasal;
//   String? halaman;
//   String isi;

//   Post({
//     this.isRead = false,
//     this.isFavorite = false,
//     required this.id,
//     required this.postfileId,
//     required this.dataFile,
//     required this.title,
//     required this.description,
//     required this.firebaseUrl,
//     this.pasal,
//     this.halaman,
//     required this.isi,
//   });

//   factory Post.fromJson(Map<String, dynamic> json) => Post(
//         isRead: json["is_read"] ?? false,
//         isFavorite: json["is_favorite"] ?? false,
//         id: json["id"] != null ? int.parse(json["id"]) : 0,
//         postfileId:
//             json["postfile_id"] != null ? int.parse(json["postfile_id"]) : 0,
//         dataFile: json["data_file"] ?? "",
//         title: json["title"] ?? "",
//         description: json["description"] ?? "",
//         firebaseUrl: json["firebase_url"] ?? "",
//         pasal: json["pasal"],
//         halaman: json["halaman"],
//         isi: json["isi"] ?? "",
//       );

//   Map<String, dynamic> toJson() => {
//         "is_read": isRead,
//         "is_favorite": isFavorite,
//         "id": id,
//         "postfile_id": postfileId,
//         "data_file": dataFile,
//         "title": title,
//         "description": description,
//         "firebase_url": firebaseUrl,
//         "pasal": pasal,
//         "halaman": halaman,
//         "isi": isi,
//       };
// }
