
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HavingCoinWidget extends StatefulWidget{
  @override
  _HavingCoinState createState() => _HavingCoinState();

}

class _HavingCoinState extends State<HavingCoinWidget>{

  @override
  Widget build(BuildContext context) {

    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: 340,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: width-32.w,
            alignment: Alignment.centerLeft,
            child: Text('보유 코인 현황',
                style:TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0.sp
                )
            ),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1,
                        color: Color(0xffECEFF1)
                    )
                )
            ),
          ),        /// 보유 코인 현황 타이틀
          Container(
            height: 46,
            width: width-32.w,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1.w,
                        color: Color(0xffECEFF1)
                    )
                )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('손익(%)',style:
                TextStyle(
                    fontSize: 14.0.sp,
                    color: Color(0xff737373)
                ),),
                Text('3,212,769 (6.58%)',style:
                TextStyle(
                    fontSize: 14.0.sp,
                    color: Color(0xffD8352C)
                ),)
              ],
            ),
          ),        /// 손익(%)
          RowInfo(width,'총 보유수량','0.022447'),     /// 총 보유수량
          RowInfo(width,'총 매수금액','959,652'),      /// 총 매수금액
          RowInfo(width,'총 평가금액','964,951'),      /// 총 평가금액
          RowInfo(width,'평균단가','42,751,924'),     /// 평균단가
          Container(
            height: 60,
            width: width-32,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OutlinedButton(
                  onPressed: () {  },
                  child: Text('입금',
                    style: TextStyle(
                        color: Color(0xff737373)
                    ),),
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(185.5.w,40.0),
                      side: BorderSide(
                          color: Color(0xffBBBBBB)
                      )
                  ),
                ),
                //SizedBox(width: 10.w,),
                OutlinedButton(
                  onPressed: () {  },
                  child: Text('출금',
                    style: TextStyle(
                        color: Color(0xff737373)
                    ),),
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(185.5.w,40.0),
                      side: BorderSide(
                          color: Color(0xffBBBBBB)
                      )
                  ),
                ),
              ],
            ),
          )       /// 입금, 출금
        ],
      ),
    );
  }

  Widget RowInfo(double width,String title,String info){
    return Container(
      height: 46,
      width: width-32.w,
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                  width: 1.w,
                  color: Color(0xffECEFF1)
              )
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('$title',style:
          TextStyle(
              fontSize: 14.0.sp,
              color: Color(0xff737373)
          ),),
          Text('$info',style:
          TextStyle(
              fontSize: 14.0.sp,
              color: Colors.black,
              fontWeight: FontWeight.bold
          ),)
        ],
      ),
    );
  }

}