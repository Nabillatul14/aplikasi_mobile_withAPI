import 'package:flutter_api_bawaslu/models/post.dart';
import 'package:http/http.dart' as http;

class RemoteServicePemilihanUUD {
  Future<List<Post>?> getPosts() async {
    var client = http.Client();

    var uri = Uri.parse('http://10.214.91.66:8000/api/pemilihanUUD');
    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return postFromJson(json);
    }
  }
}