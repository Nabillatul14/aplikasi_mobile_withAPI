import 'package:flutter_api_bawaslu/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServicePemiluUUD {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('http://192.168.0.191:8000/api/pemiluUUD');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}