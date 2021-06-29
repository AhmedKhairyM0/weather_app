import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utitilies/post.dart';

class NetworkHelper {
  final String url;
  NetworkHelper(this.url);
  Future<Post> getData() async {
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      String json = response.body;
      return Post.fromJson(jsonDecode(json));
    } else {
      throw 'Error Status: ${response.statusCode}';
    }
  }

}
