import 'package:flutter_api_bawaslu/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServicePemiluKeputusan{
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('http://192.168.68.115:8000/api/pemiluKeputusan');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}