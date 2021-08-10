import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_prac/network/wss_main.dart';
import 'package:stream_prac/serviceio/globalSGA.dart';
import 'package:stream_prac/serviceio/svcheader.dart';
import 'BeeBlockNews/beeblocknews.dart';
import 'CoinList/myCoinList.dart';
import 'CoinList/sellCoinList.dart';
import 'Cryptonews/cryptonews.dart';
import 'LoginInfoMain/centerText.dart';
import 'LoginInfoMain/head_widget.dart';
import 'MenuGrid/eventMenuWidget.dart';
import 'MenuGrid/gridItem.dart';

class MyHome extends StatefulWidget {
  MyHome({Key? key, required this.title, required gChannel}) : super(key: key);

  final String title;

  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  bool _isLogin = false;

  @override
  void initState() {
    debugPrint('initState1..');

    super.initState();

    // 시세 로그인
    //gSiseSSO('test');

    //wssSsoSvc('real');

    debugPrint('initState3..');

    gListenWss('init');

    gHeartBeat('init');
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    //SvcHeader gHeader = SvcHeader();
    //gRequst.clear();

    int seq = 0;

    return Scaffold(
        body: StreamBuilder(
            stream: gStreamCtrlSvc.stream,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return Container(
                  width: width,
                  child: ListView(children: [
                    Column(children: [
                      Container(
                        height: (260 + 376.h),
                        width: width,
                        child: Stack(children: [
                          headWidget(),

                          /// LoginHead
                          Positioned(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                    padding: EdgeInsets.only(
                                        top: 12.0, bottom: 12.0),
                                    child: SvgPicture.asset(
                                      'images/logo.svg',
                                      width: 130.0.w,
                                      height: 32.0,
                                      color: Colors.black,
                                    )),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                        visible: _isLogin ? false : true,
                                        child: OutlinedButton(
                                          onPressed: () {
                                            _MoveToLogin(context);
                                            //print(_isLogin);
                                          },
                                          child: Text(
                                            '로그인',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 14.0.sp),
                                          ),
                                          style: OutlinedButton.styleFrom(
                                              minimumSize: Size(60.0, 30.0),
                                              backgroundColor: Colors.black),
                                        )),
                                    SizedBox(
                                      width: 12.0.w,
                                    ),
                                    Icon(
                                      Icons.menu,
                                      color: Colors.black,
                                      size: 24.0,
                                    ),
                                  ],
                                )
                              ],
                            ),
                            top: 12,
                            left: 16.w,
                            right: 16.w,
                          ),

                          /// Logo
                          Positioned(
                            /// MenuItems
                            top: _isLogin ? 260 : 214,
                            child: Container(
                              width: width,
                              height: 376.h,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 16.0,
                                          left: 16.0.w,
                                          right: 16.0.w),
                                      child: centerTextWidget()),
                                  Container(
                                    height: 310.h,
                                    margin: EdgeInsets.only(top: 10.0.h),
                                    color: Color(0xffF7F7F7),
                                    padding: EdgeInsets.only(
                                        top: 16.0, left: 16.0.w, right: 16.0.w),
                                    child: gridItemWidget(),
                                  )
                                ],
                              ),
                              decoration: BoxDecoration(
                                  color: Color(0xffF7F7F7),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0))),
                            ),
                          ),
                        ]),
                      ),
                    ]),
                    Container(
                        width: width,
                        height: 147,
                        alignment: Alignment.topCenter,
                        //padding: EdgeInsets.only(top:5.0),
                        color: Color(0xffF7F7F7),
                        //color: Colors.blue,
                        child: eventMenuWidget()),
                    Container(
                      width: width,
                      height: 240,
                      color: Color(0xffF7F7F7),
                      child: myCoinListWidget(),
                    ),

                    ///  myCoinList
                    Container(
                      width: width,
                      height: 410,
                      color: Color(0xffF7F7F7),
                      child: sellCoinListWidget(),
                    ),

                    ///  SellingCoinList
                    Container(
                      width: width,
                      height: 498,
                      color: Color(0xffF7F7F7),
                      child: beeblockNewsWidget(),
                    ),

                    /// BeeBlock News
                    Container(
                      width: width,
                      height: 498,
                      color: Color(0xffF7F7F7),
                      child: cryptoNewsWidget(),
                    ),

                    /// CryptoNews
                  ]));
            })
        //body: MainFullWidget(),
        ); // This trailing comma makes auto-formatting nicer for build methods.
  }

  void _MoveToLogin(BuildContext context) async {
    _isLogin = await Navigator.pushNamed(context, '/login') as bool;
    if(_isLogin==null)
      _isLogin=false;
    print(_isLogin);
  }
}
