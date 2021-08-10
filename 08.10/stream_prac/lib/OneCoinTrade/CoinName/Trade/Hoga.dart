
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_prac/OneCoinTrade/maincoin.dart';
import 'package:stream_prac/serviceio/globalSGA.dart';

class HogaWidget extends StatefulWidget{

  @override
  _HogaWidgetState createState() => _HogaWidgetState();

}

class _HogaWidgetState extends State<HogaWidget>{

  //late List<dynamic> tmp_jsonAsks;
  //late List<dynamic> tmp_jsonBids;

  List<dynamic> jsonAsks=[];
  List<dynamic> jsonBids=[];


  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: gStreamCtrlHoga.stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData&&jsonDecode(snapshot.data)['code']=='ETH/KRW') {
          jsonAsks = jsonDecode(snapshot.data)['asks'];
          jsonBids = jsonDecode(snapshot.data)['bids'];
          //tmp_jsonAsks=jsonAsks;
          //tmp_jsonBids=jsonBids;
        }
          return ListView.builder(
            itemCount: jsonAsks.length+jsonBids.length,
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: (){
                  globalPrice=index<20?int.parse(jsonAsks[index][0]):int.parse(jsonBids[index][0]);
                  print(globalPrice);
                },
                child: Container(
                  width: 194.w,
                  height: 26,
                  decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(
                            width: 0.5.w,
                            color: Colors.white
                        ),
                        bottom: BorderSide(
                            width: 0.5.w,
                            color: Colors.white
                        ),
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 126.w,
                        color: index < 20
                            ? Color(0xff2376F1).withOpacity(0.08)
                            : Color(0xffD8352C).withOpacity(0.08),
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                color: index < 20 ? Color(0xff2376F1)
                                    .withOpacity(0.17) : Color(0xffD8352C)
                                    .withOpacity(0.17),
                              ),
                              flex: 26,
                            ),
                            Expanded(
                              child: Container(
                                color: Colors.transparent,
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4.0),
                                  child: Text('${index<20?jsonAsks[index][0].toString():jsonBids[index-20][0].toString()}',
                                    style: TextStyle(
                                        color: Color(0xffD8352C),
                                        fontSize: 12.0.sp
                                    ),
                                  ),
                                ),
                              ),
                              flex: 100,
                            )
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        width: 1.w,
                      ),
                      Container(
                        color: index <= 20
                            ? Color(0xff2376F1).withOpacity(0.08)
                            : Color(0xffD8352C).withOpacity(0.08),
                        width: 67.w,
                        child: Container(
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                          color: Colors.transparent,
                          child: Text('${index<20?jsonAsks[index][1].toString():jsonBids[index-20][1].toString()}',
                            style: TextStyle(
                              fontSize: 10.0.sp,
                              color: Colors.black
                          ),),
                        ),
                      )
                    ],
                  ),
                ),
              );
            },
          );
        }
    );
  }


}