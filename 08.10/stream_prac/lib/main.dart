import 'dart:async';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_prac/Login.dart';
import 'package:stream_prac/MainPage/mainpage.dart';
import 'package:stream_prac/OneCoinTrade/maincoin.dart';
import 'package:stream_prac/serviceio/svcheader.dart';


import 'serviceio/globalSGA.dart';
import 'network/wss_main.dart';
import 'serviceio/unitsvctest.dart';
import 'package:http/http.dart' as http;
import 'serviceio/svc20003.dart';
import 'package:crypto/crypto.dart';



void main()
{

  // svc test
  // WssMainTest();
  // return;

  // http test
  if (true) {
    //httpTest('https://zzzzzhahatestserver.beeblock.co.kr/api/tb_content/news_list?category=&keyword=&page=0&size=14&isAll=true&ver=1626668174910');
    //httpTest('https://jsonplaceholder.typicode.com/posts/1');
  }

  //dioTest('https://mocktestserver.beeblock.co.kr/api/tb_content/news_list?category=&keyword=&page=0&size=14&isAll=true&ver=1626668174910');
  //dioTest('https://jsonplaceholder.typicode.com/posts/1');

  //return;
  // app test


  runApp(MyApp());

}


class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final title = 'websocket_svc_test';
    return ScreenUtilInit(
      designSize:Size(414,896),
      builder:()=> MaterialApp(
        title: title,
        scrollBehavior: MyBehavior(),
        theme: ThemeData(
            primaryColor: Colors.white,
            fontFamily: 'NotoSansKR',
            textSelectionTheme: TextSelectionThemeData(
              //selectionHandleColor: Colors.transparent,
              cursorColor: Colors.black,
              selectionColor: Color(0xffFFBC00),
              selectionHandleColor: Colors.transparent,
            )
        ),
        initialRoute: '/',
        routes: {
          '/':(context)=>MyHome(title: title, gChannel: wssConnect(gGlobalSGA.isMode),),
          '/login':(context)=>Login(),
          '/trade':(context)=>CoinTrade(),
        },
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final String title;
  String backendData = '';

  MyHomePage({Key? key, required this.title, required gChannel}) : super(key: key);

  // MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final formKey=GlobalKey<FormState>();

  String email='';
  String passwd='';

  void initState() {
    debugPrint('initState1..');

    super.initState();

    // 시세 로그인
    //gSiseSSO('test');

    wssSsoSvc('init');

    debugPrint('initState3..');

    gListenWss('init');

    //gHeartBeat('init');

  }

  @override
  void dispose(){
    gChannel.sink.close();
    gStreamCtrlHoga.close();
    gStreamCtrlSise.close();
    gStreamCtrlSvc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    SvcHeader gHeader=SvcHeader();
    gRequst.clear();

    int seq=0;

    return Scaffold(
      body: Center(
        child: Container(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                  //validator: validateEmail,
                  onSaved: (value){
                    email=value!;
                  }
                ),
                SizedBox(height: 10.0,),
                TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: 'Password',
                    ),

                    //validator: validateEmail,
                    onSaved: (value){
                      passwd=value!;
                    }
                ),
                SizedBox(height: 10.0,),
                OutlinedButton(
                  child: Text('Submit'),
                  style: OutlinedButton.styleFrom(
                    primary: Colors.blue
                  ),
                  onPressed: (){
                    formKey.currentState!.save();
                    print(email);
                    print(passwd);
                    gRequst.clear();
                    UsrSvc20003 usrSvc20003=UsrSvc20003();
                    //gHeader._usid=email;
                    usrSvc20003.makeUsrSvc20003(usid: email,pswd: passwd);
                    gGlobalSGA.setUserPswd(email, passwd);
                    seq=gGlobalSGA.getRequestSeq();
                    gRequst.add(gHeader.setSvcHeader(usrSvc20003.requestData(), usrSvc20003.svcCode, seq));
                    //gRequst.add(gHeader.setSvcHeader(usrSvc20003.requestData(), usrSvc20003.svcCode, gGlobalSGA.getRequestSeq()));
                    gRequst.add(usrSvc20003.requestData());

                    gChannel.sink.add(gRequst.toBytes());
                    gRequst.clear();
                  },
                ),
                StreamBuilder(
                  //initialData: Text(''),
                  stream: gStreamCtrlSvc.stream,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.data == null) {
                      return Text('ready..');
                    } else {
                      UsrSvcObject usrSvcObject = snapshot.data;
                      Map<String,dynamic> json=jsonDecode(usrSvcObject.responseSvcObject);
                      return Text('header: svc(${usrSvcObject.responseHeader.svc}), seq(${usrSvcObject.responseHeader.seq})' +
                          '\nbody    :' +
                          '${json['cData'][0]['v_accn']}');


                    }
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}



