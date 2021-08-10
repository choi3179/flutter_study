import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stream_prac/Data/myCoin/myCoinData.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'calcCoin.dart';

class myCoinListWidget extends StatefulWidget {
  @override
  _myCoinListState createState() => _myCoinListState();
}

class _myCoinListState extends State<myCoinListWidget> {

  int touched_idx = 0;

  var won=NumberFormat('###,###,###,###.##',"en_US");

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;


    return Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Container(
        width: width,
        height: 50.0,
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  '보유코인',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        child: Text(
                          '평가금액순',
                          style: TextStyle(
                              color:
                                  touched_idx == 0 ? Colors.black : Colors.grey,
                              fontSize: 14.0.sp,
                              fontWeight: touched_idx == 0
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                          textAlign: TextAlign.right,
                        ),
                        onPressed: () {
                          setState(() {
                            touched_idx = 0;
                          });
                        },
                      ),
                      TextButton(
                        child: Text(
                          '수익률순',
                          style: TextStyle(
                              color:
                                  touched_idx == 1 ? Colors.black : Color(0xff737373),
                              fontSize: 14.0.sp,
                              fontWeight: touched_idx == 1
                                  ? FontWeight.bold
                                  : FontWeight.normal),
                          textAlign: TextAlign.right,
                        ),
                        onPressed: () {
                          setState(() {
                            touched_idx = 1;
                          });
                        },
                      )
                    ],
                  ),
                  //flex: 141
              )
            ],
          ),
        ),
      ),
      Container(
        width: width,
        height: 180.0,
        color: Colors.white,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: 3,
          scrollDirection: Axis.vertical,
          itemBuilder: (BuildContext context, int index) {
            String key = sampleCoinData.keys.elementAt(index);
            Map<String, Object> list = sampleCoinData[key];
            //print(list);
            return InkWell(
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
                    child: Container(
                        height: 1,
                        width: double.maxFinite,
                        color: Color(0xffECEFF1))),
                Padding(
                  child: Container(
                    //height: height * (60 / 650),
                    height: 59.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('images/Frame281.png'),     /// 상승 하락률 게이지
                            Padding(
                              padding: EdgeInsets.only(left: 10.0.w),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${list['name']}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14.0.sp,
                                    ),
                                  ),
                                  Text(
                                    '${list['code']}',
                                    style: TextStyle(
                                      color: Color(0xff737373),
                                      fontSize: 13.0.sp,
                                    ),
                                  )
                                ],
                              ),      /// 코인 정렬 탭
                            )
                          ],
                        ),
                        calcWidget(list),
                      ],
                    ),
                  ),
                  padding: EdgeInsets.only(left: 16.w, right: 16.w),
                ),
              ]),
              onTap:(){
                Navigator.pushNamed(context,'/trade');
              }
            );
          },
        ),
      ),
      SizedBox(
        width: width,
        height: 10.0,
      )
    ]);
  }
}
