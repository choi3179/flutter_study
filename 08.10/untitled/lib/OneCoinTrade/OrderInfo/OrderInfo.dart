import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:untitled/OneCoinTrade/OrderInfo/InfoTable.dart';
import 'package:untitled/tempClass.dart';

class OrderInfo extends StatefulWidget {
  @override
  _OrderInfoState createState() => _OrderInfoState();
}

class _OrderInfoState extends State<OrderInfo> {

  int _orderIdx=0;
  int _orderedCoinIdx=0;


  @override
  Widget build(BuildContext context) {

    final double width=MediaQuery.of(context).size.width;

    return Container(
        height: 498,
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        color: Colors.white,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                  width: width - 32.w,
                  height: 50.0,
                  alignment: Alignment.centerLeft,
                  decoration: BoxDecoration(
                      border: Border(
                          bottom: BorderSide(width: 1.w, color: Color(0xffECEFF1)))),
                  child: Text('주문정보',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0.sp,
                        fontWeight: FontWeight.bold,
                      ))
              ),      /// 주문 정보 타이틀 헤더
              Container(
                height: 40,
                width: width-32.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TapInfo(0,'미체결 주문'),
                    TapInfo(1,'체결 내역'),
                    TapInfo(2,'스탑 주문'),
                  ],
                ),
              ),      /// 미체결 주문, 체결 내역, 스탑 주문 탭바
              Container(
                height: 62,
                width: width-32.w,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed: () {  },
                      child: Text('선택 취소',
                        style: TextStyle(
                            color: Color(0xff737373)
                        ),),
                      style: OutlinedButton.styleFrom(
                          minimumSize: Size(150.0.w,34.0),
                          side: BorderSide(
                              color: Color(0xffBBBBBB)
                          )
                      ),
                    ),
                    Container(
                      width: 155.w,
                      child : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _orderedCoinIdx=0;
                                });
                              },
                              child: Text('전체 코인',
                              style: TextStyle(
                                fontSize: 13.0.sp,
                              ),),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(72.5.w,34.0),
                                padding: EdgeInsets.symmetric(horizontal: 0.0),
                                shadowColor: Colors.transparent,
                                primary: _orderedCoinIdx==0?Color(0xffFFBC00):Color(0xffEEEEEE),
                                onPrimary: _orderedCoinIdx==0?Colors.black:Color(0xff737373)
                              ),
                            ),
                            flex: 1,
                          ),
                          SizedBox(width: 5.0.w,),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _orderedCoinIdx=1;
                                });
                              },
                              child: Text('현재 코인',
                                style: TextStyle(
                                    fontSize: 13.0.sp
                                ),),
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(72.5.w,34.0),
                                padding: EdgeInsets.symmetric(horizontal: 0.0),
                                primary: _orderedCoinIdx==1?Color(0xffFFBC00):Color(0xffEEEEEE),
                                onPrimary: _orderedCoinIdx==1?Colors.black:Color(0xff737373),
                                shadowColor: Colors.transparent
                              ),
                            ),
                            flex: 1,
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),      /// 선택취소 && 전체코인, 현재코인
              /*Container(
                height: 300,
                width: width-32.w,
                child: Column(
                  children: [
                    Container(
                      height:60,
                      decoration: BoxDecoration(
                        border: Border.symmetric(
                          horizontal: BorderSide(
                            width: 1,
                            color: Color(0xffBBBBBB)
                          )
                        )
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 30,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                border: Border(
                                  right: BorderSide(
                                    width: 1,
                                    color: Color(0xffBBBBBB)
                                  )
                                )
                              ),
                              alignment: Alignment.center,
                              child: Icon(Icons.radio_button_unchecked_outlined,color: Color(0xff737373),),
                            ),
                          ),
                          Expanded(
                            flex: 88,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color: Color(0xffBBBBBB)
                                      )
                                  )
                              ),
                              alignment: Alignment.center,
                              child: Text('종목'),
                            ),
                          ),
                          Expanded(
                            flex: 88,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color: Color(0xffBBBBBB)
                                      )
                                  )
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex:1,
                                    child: Container(
                                        width: (width-62.w)/4,
                                        decoration: BoxDecoration(
                                          border: Border(
                                            bottom: BorderSide(
                                              width: 1,
                                              color: Color(0xffBBBBBB)
                                            )
                                          )
                                        ),
                                        alignment: Alignment.center,
                                        child: Text('주문가격'),
                                      ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text('거래종류'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 88,
                            child: Container(
                              height: 60,
                              decoration: BoxDecoration(
                                  border: Border(
                                      right: BorderSide(
                                          width: 1,
                                          color: Color(0xffBBBBBB)
                                      )
                                  )
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex:1,
                                    child: Container(
                                      width: (width-62.w)/4,
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  width: 1,
                                                  color: Color(0xffBBBBBB)
                                              )
                                          )
                                      ),
                                      alignment: Alignment.center,
                                      child: Text('주문수량'),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      alignment: Alignment.center,
                                      child: Text('체결/미체결'),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 88,
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('주문시간'),
                            ),
                          )
                        ],
                      )
                    )
                  ],
                ),
              ),*/     /// 주문정보 테이블 헤더(Container, Expanded로 일일히 제작...)
              DataTableExample(),
              Padding(
                padding: EdgeInsets.all(10.0),
                child: Text('더 보기',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.bold
                  ),
                ),
              )
            ]));
  }

  Widget TapInfo(int op,String text){
    return Expanded(
      flex: 1,
      child: Container(
        child: TextButton(
          onPressed: () {
            setState(() {
              _orderIdx=op;
            });
          },
          child: Text('$text',
          maxLines: 1,
          style: TextStyle(
            fontSize: 14.0.sp,
            fontWeight:
            op == _orderIdx ? FontWeight.bold : FontWeight.normal,
            color: op == _orderIdx ? Colors.black : Color(0xff737373),
          ),
          ),
        ),
        decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                      width: 2.w,
                      color: op == _orderIdx ? Colors.black : Color(0xffE0E3E5)
              )
            )
        )
      ),
    );
  }
}

