import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart';
import 'package:simple_html_css/simple_html_css.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';
import 'package:untitled2/OrderInfo.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:untitled2/httpsession.dart';


Future<dynamic> httpTest(String url) async {
  HttpSession httpSession = HttpSession();

  var response = await httpSession.get(url);

  if (response == null) {
    print('response:fail.. : ' + httpSession.statusCode.toString());
  } else {
    if (response is List<dynamic>) {
      print('response is list, ' + url);
    } else {
      print('response is map,  ' + url);
    }

    // print(response.runtimeType.toString());

    print('response: ' + response.toString());
  }

  return response;
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);


  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Center(
          child: Container(
            padding: EdgeInsets.all(16.0),
            child: FutureBuilder<dynamic>(
              //future: httpTest('https://zzzzzhahatestserver.beeblock.co.kr/api/tb_content/news_list?category=&keyword=&page=0&size=14&isAll=true&ver=1626668174910'),
                future: httpTest('https://zzzzzhahatestserver.beeblock.co.kr/api/tb_content/get_pk?pk=0513_01&category=BN&subCategory=BN_E&lang=ko&isNear=true&isSubCategory=false&ver=1628144636828'),
                //future:httpTest('https://zzzzzhahatestserver.beeblock.co.kr/api/tb_content/get_pk?pk=123123213_11&category=BN&subCategory=BN_E&lang=ko&isNear=true&isSubCategory=false&ver=1628147521690'),
                builder: (BuildContext context,AsyncSnapshot snapshot){
                if(snapshot.hasData==false){
                  return CircularProgressIndicator();
                }else if(snapshot.hasError){
                  return Text('Error:${snapshot.error}');
                }else{
                  //var json=Map<String,dynamic>.from(snapshot.data);
                  print(json is Map? true:false);
                  //return Text('${json['content']['content']}');
                  /*return RichText(
                    text: HTML.toTextSpan(context,json['content']['content']),
                  );*/
                  return SingleChildScrollView(
                    child: Html(
                      data: snapshot.data['content']['content'],
                    ),
                  );
                }
              }
            ),
          ),
        )
    );
  }


}


