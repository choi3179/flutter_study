import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';


class Post {
  final int? userId;
  final int? id;
  final String? title;
  final String? body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json)
  {
    return Post(
      id: json['id'],
      userId: json['userId'],
      body: json['body'],
      title: json['title']
    );

  }
}

/*Future<Post> getSinglePostData(context) async {
  Post result;
  try {
    final response = await http.get(
      "https://jsonplaceholder.typicode.com/posts/1",
      headers: {
        HttpHeaders.contentTypeHeader: "application/json",
      },
    );
    if (response.statusCode == 200) {
      final item = json.decode(response.body);
      result = Post.fromJson(item);
    } else {
      Toast.show("Data not found", context,
          duration: 2, backgroundColor: Colors.redAccent);
    }
  } catch (e) {
    print(e);
  }
  return result;
}*/

class PostProvider with ChangeNotifier
{

   String url;
   bool   loading = false;

  List<Post> _post = [];

  PostProvider({required String url})
  :this.url = url
      ;

  List<Post> get post => _post;

  List<Post> getPostList() {
    _fetchPost();
    return _post;
  }

  void _fetchPost() async
  {
    try {

      loading = true;

      final response = await http.get(Uri.parse(this.url));
      if (response.statusCode == 200) {
        final List<Post> parsedResponse = jsonDecode(response.body).map<Post>((json) => Post.fromJson(json)).toList();
        _post.clear();
        _post.addAll(parsedResponse);
      } else {
         print("Data not found");
      }
    } catch (e) {
      print("exception: " + e.toString());
    }

    loading = false;

     notifyListeners();
  }



}