import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class headWidget extends StatefulWidget {
  headWidget();

  @override
  _headWidgetState createState() => _headWidgetState();
}

class _headWidgetState extends State<headWidget> {
  //var won=NumberFormat.currency(locale:"ko_KR",symbol: "");
  var won = NumberFormat('###,###,###,###.##', "en_US");

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 280,
      //height: height*(259.0/699.0),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background_yellow.png'),
              fit: BoxFit.fill)),
      child: Padding(
        padding:
            EdgeInsets.only(left: 16.0.w, right: 16.0.w, top: 62, bottom: 16),
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 164,
          margin: EdgeInsets.only(bottom: 20.0, top: 11.0),
          //height: height/2.8,
          decoration: BoxDecoration(
              color: Colors.transparent
              ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('홍길동 님의 총 보유자산입니다.',style:TextStyle(
                fontSize: 16.0.sp,
                color: Color(0xff7C4B00),
                fontWeight: FontWeight.bold
              ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text('${won.format(80700000)}',style: TextStyle(
                          fontSize:24.0.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                      ),),
                      SizedBox(width: 5.0.w,),
                      Text('원',style: TextStyle(
                        fontSize:18.0.sp,
                      ),)
                    ],
                  ),
                  Container(
                    width: 30.w,
                    height: 30.w,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(Icons.more_vert),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 2.0),
                width: 133.w,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16.0.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset('images/Polygon 28.svg'),
                    Text(' ${won.format(137000)}',style: TextStyle(
                      fontSize: 13.0.sp,
                      color: Color(0xffD8352C),
                      fontWeight: FontWeight.bold
                    ),),
                    Text(' (0.24%)',style: TextStyle(
                      fontSize: 13.0.sp,
                      color: Color(0xffD8352C),
                      fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 18.0,),
              Container(
                width: MediaQuery.of(context).size.width-32.w,
                height: 62,
                padding: EdgeInsets.symmetric(vertical: 10.0.h,horizontal: 16.0.w),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(16.0.r),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('보안등급',style: TextStyle(
                            fontSize: 13.0.sp,
                            color: Color(0xff7C4B00)
                        ),),
                        Text('Lv.2',style: TextStyle(
                            fontSize: 16.0.sp,
                            color: Color(0xff7C4B00),
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('출금 잔여한도',style: TextStyle(
                                fontSize: 13.0.sp,
                                color: Color(0xff7C4B00)
                            ),),
                            Text('${won.format(2000000)}',style: TextStyle(
                                fontSize: 16.0.sp,
                                color: Color(0xff7C4B00),
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 13.0.w),
                          child: Container(
                            width: 1.w,
                            height: 42.0,
                            color: Color(0xff7C4B99).withOpacity(0.4),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text('출금 한도',style: TextStyle(
                                fontSize: 13.0.sp,
                                color: Color(0xff7C4B00)
                            ),),
                            Text('${won.format(2000000)}',style: TextStyle(
                                fontSize: 16.0.sp,
                                color: Color(0xff7C4B00),
                                fontWeight: FontWeight.bold
                            ),),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
