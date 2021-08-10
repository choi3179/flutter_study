import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:beeblock_test_yellow/Data/mycoin/myCoinData.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/CoinName/CoinName/CoinBottomSheet.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/CoinName/CoinName/MiniChart.dart';

class CoinNameWidget extends StatefulWidget {
  final double _price;
  final double _percentage;

  CoinNameWidget(this._price, this._percentage);

  @override
  _CoinNameState createState() => _CoinNameState(this._price, this._percentage);
}

class _CoinNameState extends State<CoinNameWidget> {
  final double _price;
  final double _percentage;

  var won = NumberFormat('###,###,###,###.##', "en_US");

  _CoinNameState(this._price, this._percentage);

  @override
  Widget build(BuildContext context) {
    return Center(
      /*child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width - 32.w,
            height: 24,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                InkWell(
                  child: Row(
                    children: [
                      Text(
                        '${sampleCoinData['BTC']['name']} ${sampleCoinData['BTC']['code']}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16.0.sp,
                        ),
                      ),
                      Icon(
                        Icons.arrow_drop_down,
                        size: 24.0.w,
                      ),
                    ],
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: buildBottomSheet,
                        //backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        clipBehavior: Clip.antiAliasWithSaveLayer);
                  },
                ),
                Row(
                  children: [
                    Text(
                      '5.848178',
                      style: TextStyle(
                          fontSize: 12.0.sp, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      ' 거래량 (24H)',
                      style: TextStyle(
                          fontSize: 10.0.sp, color: Color(0xff737373)),
                    ),
                  ],
                )
              ],
            ),
          ),      /// 코인이름 & 거래량(24H)
          Container(
            width: MediaQuery.of(context).size.width - 32.w,
            height: 35,
            //padding: EdgeInsets.only(bottom: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '${won.format(sampleCoinData['BTC']['price'])}',
                        style: TextStyle(
                            color: Color(0xffD8352C),
                            fontSize: 20.0.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        Icons.arrow_drop_up_sharp,
                        color: Color(0xffD8352C),
                      ),
                      Text(
                        '${won.format(_price)}',
                        style: TextStyle(
                            color: Color(0xffD8352C),
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' (${(_percentage.toStringAsFixed(2))}%)',
                        style: TextStyle(
                            color: Color(0xffD8352C),
                            fontSize: 12.0.sp,
                            fontWeight: FontWeight.bold),
                      )
                    ]),
                MiniChart()
              ],
            ),
          )
        ],
      ),*/
      child: Container(
        height: 64,
        color: Colors.white,
        padding: EdgeInsets.only(left: 16.0.w, right: 16.0.w),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  child: Container(
                    height:24,
                    child: Row(
                      children: [
                        Text(
                          '${sampleCoinData['BTC']['name']} ${sampleCoinData['BTC']['code']}',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0.sp,
                          ),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          size: 24.0.w,
                        ),
                      ],
                    ),
                  ),
                  onTap: () {
                    showModalBottomSheet(
                        context: context,
                        builder: buildBottomSheet,
                        //backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20))),
                        clipBehavior: Clip.antiAliasWithSaveLayer);
                  },
                ),
                Container(
                  //height: 24,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          '${won.format(sampleCoinData['BTC']['price'])}',
                          style: TextStyle(
                              color: Color(0xffD8352C),
                              fontSize: 20.0.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Icon(
                          Icons.arrow_drop_up_sharp,
                          color: Color(0xffD8352C),
                        ),
                        Text(
                          '${won.format(_price)}',
                          style: TextStyle(
                              color: Color(0xffD8352C),
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          ' (${(_percentage.toStringAsFixed(2))}%)',
                          style: TextStyle(
                              color: Color(0xffD8352C),
                              fontSize: 12.0.sp,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                )
              ],
            ),
            Column(
              children: [
                Container(
                  height: 20,
                  alignment: Alignment.center,
                  child: Row(
                    children: [
                      Text(
                        '5.848178',
                        style: TextStyle(
                            fontSize: 12.0.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        ' 거래량 (24H)',
                        style: TextStyle(
                            fontSize: 10.0.sp, color: Color(0xff737373)),
                      ),
                    ],
                  ),
                ),
                MiniChart()
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context) {
    return GestureDetector(
      onTap: (){
        FocusScope.of(context).unfocus();
      },
      child: BuildCoinBottomSheet()
    );
  }     /// Bottom sheet
}
