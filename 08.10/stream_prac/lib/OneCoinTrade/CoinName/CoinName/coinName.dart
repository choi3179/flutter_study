import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:stream_prac/Data/mycoin/myCoinData.dart';
import 'package:stream_prac/OneCoinTrade/CoinName/CoinName/CoinBottomSheet.dart';
import 'package:stream_prac/OneCoinTrade/CoinName/CoinName/MiniChart.dart';
import 'package:stream_prac/serviceio/globalSGA.dart';
import 'package:stream_prac/serviceio/svc106122.dart';
import 'package:stream_prac/serviceio/svcheader.dart';

class CoinNameWidget extends StatefulWidget {

  final String _code;
  final String _price;
  final String _change;
  final String _rate;

  CoinNameWidget(this._code,this._price, this._change,this._rate);

  @override
  _CoinNameState createState() => _CoinNameState(this._code,this._price, this._change,this._rate);

}

class _CoinNameState extends State<CoinNameWidget> {

  final String _code;
  final String _price;
  final String _change;
  final String _rate;

  var won = NumberFormat('###,###,###,###.##', "en_US");

  //_CoinNameState(this._price, this._percentage);
  _CoinNameState(this._code,this._price, this._change,this._rate);

  SvcHeader gHeader=SvcHeader();

  @override
  Widget build(BuildContext context) {

    String code=_code;
    String price=_price;
    String change=_change;
    String rate=_rate;

    return StreamBuilder(
      stream: gStreamCtrlSise.stream,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if(snapshot.hasData) {
          UsrSvcRtsCheg usrSvcRtsCheg = UsrSvcRtsCheg();
          usrSvcRtsCheg.parseData(snapshot.data);
          code = usrSvcRtsCheg.code.toString();
          price = won.format(double.parse(usrSvcRtsCheg.curr));
          change = won.format(double.parse(usrSvcRtsCheg.diff));
          rate = usrSvcRtsCheg.rate;
          /*return Center(
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
                          height: 24,
                          child: Row(
                            children: [
                              Text(
                                //'${sampleCoinData['BTC']['name']} ${sampleCoinData['BTC']['code']}',
                                '비트코인 $_code',
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
                                //'${won.format(sampleCoinData['BTC']['price'])}',
                                //'${won.format(double.parse(json['ticker']['price']))}',
                                '$_price',
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
                                //'${won.format(_price)}',
                                //'${won.format(double.parse(json['ticker']['change']))}',
                                //'${won.format(sampleCoinData['BTC']['price'])}',
                                '$_change',
                                style: TextStyle(
                                    color: Color(0xffD8352C),
                                    fontSize: 12.0.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                //' (${(_percentage.toStringAsFixed(2))}%)',
                                //' (${json['ticker']['rate']}%)',
                                ' ($_rate%)',
                                //'${won.format(sampleCoinData['BTC']['price'])}',
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
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.bold),
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
          );*/
        }
        return Center(
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
                        height: 24,
                        child: Row(
                          children: [
                            Text(
                              //'${sampleCoinData['BTC']['name']} ${sampleCoinData['BTC']['code']}',
                              '이더리움 $code',
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
                              //'${won.format(sampleCoinData['BTC']['price'])}',
                              //'${won.format(double.parse(price))}',
                              '$price',
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
                              //'${won.format(_price)}',
                              //'${won.format(double.parse(change))}',
                              //'${won.format(sampleCoinData['BTC']['price'])}',
                              '$change',
                              style: TextStyle(
                                  color: Color(0xffD8352C),
                                  fontSize: 12.0.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            Text(
                              //' (${(_percentage.toStringAsFixed(2))}%)',
                              //' (${json['ticker']['rate']}%)',
                              ' ( ${rate.trim()}%)',
                              //'${won.format(sampleCoinData['BTC']['price'])}',
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
                                fontSize: 12.0.sp,
                                fontWeight: FontWeight.bold),
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
