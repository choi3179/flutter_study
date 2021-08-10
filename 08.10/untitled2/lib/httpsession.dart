import 'dart:convert';
import 'package:http/http.dart' as http;





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

/*
https://stackoverflow.com/questions/60648984/handling-exception-http-request-flutter
 */

class HttpSession {
   Map<String, String> headers = {
     'Content-Type': 'application/json',
     'Accept'      : 'application/json'
   };

   Map<String, String> cookies = {};

   int statusCode = 0;

   Future<dynamic> get(String url) async {
     statusCode = 0;

     try {
       //print('get() url: $url');

       // http.Response response = await http.get(Uri.parse(url), headers: headers);
       http.Response response = await http.get(Uri.parse(url), headers: headers)
           .timeout(const Duration(seconds: 5));
       //   var response = await http.get(fullUrl, headers: _setHeaders()).timeout(const Duration(seconds: 60));

       statusCode = response.statusCode;

       if (statusCode == 200) {
         return jsonDecode(utf8.decode(response.bodyBytes));
       } else {
         print("get().fail.. : " + statusCode.toString() + ', url:' + url);
       }
/*     } on SocketException {
       throw FetchDataException('No Internet connection');
     } on TimeoutException catch (e) {
       res = {
         "success": false,
         "status": response.statusCode,
         "message": "Connection timeout"
       };   */
     } catch(e) {
       print("get(): exception: " + e.toString() + ', statusCode:' + statusCode.toString() + ', ');
     }

   }

   Future<dynamic> post(String url, dynamic data) async {

     statusCode = 0;

     try {
       //print('post() url.. : $url');

       http.Response response = await http.post(Uri.parse(url), body: json.encode(data), headers: headers);

       statusCode = response.statusCode;
       if (statusCode == 200) {
         return json.decode(utf8.decode(response.bodyBytes));
       } else {
         print("post().fail.. : " + statusCode.toString() + ', url:' + url);
       }
     } catch(e) {
       print("post(): exception: " + e.toString() + ', statusCode:' + statusCode.toString());
     }

     //print('post().last... : ' );
   }

}
