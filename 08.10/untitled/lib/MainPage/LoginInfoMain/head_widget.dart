import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class headWidget extends StatefulWidget {

  headWidget();

  @override
  _headWidgetState createState() => _headWidgetState();
}

class _headWidgetState extends State<headWidget> {

  //var won=NumberFormat.currency(locale:"ko_KR",symbol: "");
  var won=NumberFormat('###,###,###,###.##',"en_US");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 283,
      //height: height*(259.0/699.0),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/Frame290.png'),
              fit: BoxFit.fill
          )),
      child: Padding(
        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 67, bottom: 20),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 155,
          margin: EdgeInsets.only(bottom: 20.0,top: 11.0),
          //height: height/2.8,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              //color: Color(0xcc0A50B9)
              color:Color(0xcc00327D)
              //color: Colors.yellow
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 16.0,bottom: 16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '홍길동 님의 총 보유자산입니다.',
                          style: TextStyle(
                              fontSize: 16.0.sp, color: Color(0xff78DFFF)),
                        ),
                        Icon(
                          Icons.more_vert,
                          size: 24.0.w,
                          color: Colors.white,
                        )
                      ],
                    ),
                    SizedBox(height: 2,),
                    Row(
                      children: [
                        Text(
                          //'80,700,000 원',
                          '${won.format(807000000)}',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 24.0.sp,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.start,
                        ),
                        Text(' 원',style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.0.sp,
                            //fontWeight: FontWeight.bold
                            ),
                          textAlign: TextAlign.start,)
                      ],
                    ),
                    Padding(
                        padding: EdgeInsets.only(top: 7.0, bottom: 12.0),
                        child: Container(
                          height: 1,
                          width: double.maxFinite,
                          color: Colors.grey[200]!.withOpacity(0.3),
                        )), /// Divider
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      //crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '보안등급',
                                style: TextStyle(
                                    color: Colors.grey[200]!.withOpacity(0.7),
                                    fontSize: 13.0.sp),
                              ),
                              SizedBox(height: 2,),
                              Text(
                                'Lv.2',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 16.0.sp),
                              )
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '출금 잔여한도',
                              style: TextStyle(
                                  color: Colors.grey[200]!.withOpacity(0.7),
                                  fontSize: 13.0.sp),
                            ),
                            SizedBox(height: 2,),
                            Text(
                              '${won.format(2000000)}',
                              style: TextStyle(
                                  color: Color(0xffFFC700), fontSize: 16.0.sp),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.0.w),
                          child: Container(
                            width: 1.w,
                            height: 42.0,
                            color: Colors.grey[200]!.withOpacity(0.3),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '출금 한도',
                              style: TextStyle(
                                  color: Colors.grey[200]!.withOpacity(0.7),
                                  fontSize: 13.0.sp),
                            ),
                            SizedBox(height: 2,),
                            Text(
                              '${won.format(2000000)}',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 16.0.sp),
                            )
                          ],
                        ),
                      ],
                    )   /// 보안등급, 출금잔여한도, 출금한도
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
