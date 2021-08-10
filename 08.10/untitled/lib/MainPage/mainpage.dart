import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'BeeBlockNews/beeblocknews.dart';
import 'CoinList/myCoinList.dart';
import 'CoinList/sellCoinList.dart';
import 'Cryptonews/cryptonews.dart';
import 'LoginInfoMain/centerText.dart';
import 'LoginInfoMain/head_widget.dart';
import 'MenuGrid/eventMenuWidget.dart';
import 'MenuGrid/gridItem.dart';

/*class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {*/
class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Container(
            width: width,
            child: ListView(children: [
              Container(
                  height: (283+282.h),
                  width: width,
                  child: Column(children: [
                    Container(
                      height: (283+282.h),
                      width: width,
                      child: Stack(children: [
                        headWidget(),    /// LoginHead
                        Positioned(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding:EdgeInsets.only(top:12.0,bottom: 12.0),
                                  child: SvgPicture.asset('images/logo.svg',width: 130.0.w,height: 32.0,)
                              ),
                              Icon(Icons.menu, color: Colors.white)
                            ],
                          ),
                          top:12,
                          left: 16.w,
                          right: 16.w,
                        ),   /// Logo
                        Positioned(   /// MenuItems
                          top: 283,
                          child: Container(
                              width: width,
                              height: 282.h,
                              color: Color(0xffF7F7F7),
                              //color: Colors.grey[700],
                              child: Center(child: gridItemWidget())
                          ),
                        ),
                        Positioned(   ///CenterText
                          child: centerTextWidget(),
                          top: (283-17.0),
                          left: 10.w,
                          right: 10.w,
                        ),
                      ]),
                    ),
                  ])),
              Container(
                  width: width,
                  height: 147,
                  //padding: EdgeInsets.only(top:5.0),
                  color: Color(0xffF7F7F7),
                  child: eventMenuWidget()
              ),  ///   EventBanner
              Container(
                width: width,
                height: 240,
                color: Color(0xffF7F7F7),
                child: myCoinListWidget(),
              ),  ///  myCoinList
              Container(
                width: width,
                height: 410,
                color: Color(0xffF7F7F7),
                child: sellCoinListWidget(),
              ),  ///  SellingCoinList
              Container(
                width: width,
                height: 498,
                color: Color(0xffF7F7F7),
                child: beeblockNewsWidget(),
              ),  /// BeeBlock News
              Container(
                width: width,
                height: 498,
                color: Color(0xffF7F7F7),
                child: cryptoNewsWidget(),
              ),   /// CryptoNews
            ]))
    ); // This trailing comma makes auto-formatting nicer for build methods.
  }
}