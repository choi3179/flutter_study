import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:untitled/Data/sellCoinData.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'calcCoin.dart';

class sellCoinListWidget extends StatefulWidget {
  @override
  _sellCoinState createState() => _sellCoinState();
}

class _sellCoinState extends State<sellCoinListWidget> {

  int touched_idx = 0;

  var won=NumberFormat('###,###,###,###.##',"en_US");

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery
        .of(context)
        .size
        .width;
    final double height = MediaQuery
        .of(context)
        .size
        .height;

    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: width,
        height: 50.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Text(
              '코인',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Expanded(
                TextButton.icon(
                  onPressed: () {
                    setState(() {
                      touched_idx = 0;
                      print(touched_idx);
                    });
                  },
                  icon: Icon(
                    Icons.star,
                    color: touched_idx == 0 ? Color(0xffFFB11A) : Color(
                        0xff737373),size: 17.0.w,
                  ),
                  label: Text(
                    '관심코인',
                    textScaleFactor: 1.0,
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontSize: 14.0.sp,
                      fontWeight: touched_idx == 0
                          ? FontWeight.bold
                          : FontWeight.normal,
                      color: touched_idx == 0 ? Colors.black : Color(
                          0xff737373),
                    ),
                  ),
                ),
                TextButton(
                    onPressed: () {
                      setState(() {
                        touched_idx = 1;
                        print(touched_idx);
                      });
                    },
                    child: Text(
                      '종목순',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 14.0.sp,
                        fontWeight: touched_idx == 1
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: touched_idx == 1 ? Colors.black : Color(
                            0xff737373),
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        touched_idx = 2;
                        print(touched_idx);
                      });
                    },
                    child: Text(
                      '평가금액순',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 14.0.sp,
                        fontWeight: touched_idx == 2
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: touched_idx == 2 ? Colors.black : Color(
                            0xff737373),
                      ),
                    )),
                TextButton(
                    onPressed: () {
                      setState(() {
                        touched_idx = 3;
                        print(touched_idx);
                      });
                    },
                    child: Text(
                      '전일대비순',
                      textScaleFactor: 1.0,
                      style: TextStyle(
                        fontSize: 14.0.sp,
                        fontWeight: touched_idx == 3
                            ? FontWeight.bold
                            : FontWeight.normal,
                        color: touched_idx == 3 ? Colors.black : Color(
                            0xff737373),
                      ),
                    )),
                //flex:1
                //)
              ],
            )
          ]),
        ),
      ),
      Container(      // 코인 리스트
        width: width,
        height: 360.0,
        color: Colors.white,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 6,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            String key = sampleSellCoinData.keys.elementAt(index);
            Map<String, Object> list = sampleSellCoinData[key];

            return Column(children: [
              Padding(
                  padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                  child: Container(
                      height: 1,
                      width: double.maxFinite,
                      color: Color(0xffECEFF1))),
              Padding(
                child: Container(
                  //height: height * (60 / 650),
                  height:59.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('images/Frame281.png'),
                          Padding(
                            padding: EdgeInsets.only(left: 10.0.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('${list['name']}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0.sp,
                                  ),),
                                Text('${list['code']}', style: TextStyle(
                                  color: Color(0xff737373),
                                  fontSize: 13.0.sp,
                                ),)
                              ],
                            ),
                          )
                        ],
                      ), // 코인이름 및 변동 차트
                      Flexible(child: calcWidget(list),flex:7,fit: FlexFit.tight,),
                      Expanded(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 4.0.w),
                              child: Text('${won.format(list['volume'])}', style: TextStyle(
                                  fontSize: 15.0.sp,
                                  fontWeight: FontWeight.bold),
                                textScaleFactor: 1.0,
                              ),
                            ),
                            Text('백만', style: TextStyle(
                                fontSize: 12.0.sp,
                                color: Color(0xff737373)
                            ),),
                          ],
                        ),
                        flex: 4,
                      ),
                      Expanded(child:Icon(Icons.star, color: Color(0xffFFB11A),size: 17.0.w,),flex: 1,)
                    ],
                  ),
                ),
                padding: EdgeInsets.only(left: 16.0.w, right: 16.w),
              ),
            ]);
          },
        ),
      ),
    ]);
  }
}
