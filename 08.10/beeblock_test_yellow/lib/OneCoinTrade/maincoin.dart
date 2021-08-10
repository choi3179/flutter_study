import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:unicorndial/unicorndial.dart';
import 'package:beeblock_test_yellow/Data/mycoin/myCoinData.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/AppBar/appbar.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/CoinChart/calcCoin.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/CoinInformation/coinInfoTable.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/CoinName/Chart/gauge.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/CoinName/Chart/chart.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/CoinName/CoinName/coinName.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/CoinName/Trade/Hoga.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/CoinName/Trade/maesu.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/CoinName/Trade/maedo.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/CoinName/Trade/unclearedtrade.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/HavingCoin/HavingCoin.dart';
import 'package:beeblock_test_yellow/OneCoinTrade/OrderInfo/OrderInfo.dart';



class CoinTrade extends StatefulWidget {
  @override
  _CoinTrateState createState() => _CoinTrateState();
}

class _CoinTrateState extends State<CoinTrade> {
  var won = NumberFormat('###,###,###,###.##', 'en_US');
  double _price = 0;
  double _percentage = 0;

  //int _durationIdx = 0;
  int _tradeIdx = 0;
  int _siseSortIdx = 0;   /// 매수, 매도, 미체결, 주문정보 선택

  final ScrollController _scrollController=ScrollController();

  @override
  void initState(){
    _scrollController.addListener(() {
      //print('offset=== ${_scrollController.offset}');
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    _price = double.parse('${sampleCoinData['BTC']['price']}') -
        double.parse('${sampleCoinData['BTC']['siga']}');
    _percentage =
        _price / double.parse('${sampleCoinData['BTC']['siga']}') * 100;

    return Scaffold(
        floatingActionButton: UnicornDialer(
            backgroundColor: Color.fromRGBO(0, 0, 0, 0.7),
            parentButtonBackground: Color(0xffFFBC00),
            orientation: UnicornOrientation.VERTICAL,
            parentButton: Icon(Icons.add,),
            animationDuration: 0,
            childButtons: FloatingButtonItems(context,_scrollController)),
        appBar: makeAppBar(context),
        body: Builder(builder: (context) {
          return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                  width: width,
                  color: Color(0xffF7F7F7),
                  child: ListView(
                    controller: _scrollController,
                    children: [
                      CoinNameWidget(_price, _percentage),/// CoinNameHead
                      Container(
                        height: 648,
                        width: width,
                        color: Colors.white,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                                width: 194.w, height: 648, child: HogaWidget()),    /// 호가
                            Container(
                              width: 220.w,
                              height: 648,
                              decoration: BoxDecoration(
                                  border: Border(
                                      top: BorderSide(
                                          width: 1, color: Color(0xffF7F7F7)))),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 220.w,
                                    height: 40,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        TapText(0, '매수', 9),
                                        TapText(1, '매도', 9),
                                        TapText(2, '미체결', 12),
                                        TapText(3, '주문정보', 14),
                                      ],
                                    ),
                                  ),      /// TradeMethodTap
                                  TradeTap(_tradeIdx)
                                ],
                              ),
                            )

                            /// 거래 주문
                          ],
                        ),
                      ),            /// 호가 창 + 주문 창
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 137,
                        width: width,
                        color: Colors.white,
                        child: Padding(
                            padding: EdgeInsets.only(
                                left: 16.0.w, right: 16.0.w, top: 24.0),
                            child: calcWidget(sampleCoinData['BTC'])),
                      ),            /// 차트 상단 코인 이름, 가격
                      ChartWidget(),            /// 차트 & 시간 탭
                      Container(
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 16.0.w, right: 16.0.w),
                          child: Container(
                            height: 1,
                            color: Color(0xffECEFF1),
                          ),
                        ),
                      ),          /// 시간 and 게이지 Divider
                      PriceGauge(),            /// 가격 게이지
                      SizedBox(
                        height: 10,
                      ),
                      HavingCoinWidget(),     /// 보유 코인 정보
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 362,
                        color: Colors.white,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: width - 32.w,
                                height: 50.0,
                                decoration: BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            width: 1.w,
                                            color: Color(0xffECEFF1)
                                        )
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '시세',
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.0.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        SiseSortTapText(0, '체결순'),
                                        SiseSortTapText(1, '일별순')
                                      ],
                                    ),
                                  ],
                                ),
                              ),      /// 상단 타이틀 && 체결순, 일별순 탭
                              Container(
                                height: 36,
                                width: width-32.w,
                                decoration: BoxDecoration(
                                      border: Border(
                                          bottom: BorderSide(
                                              width: 1.w,
                                              color: Color(0xffECEFF1)
                                          )
                                      )
                                  ),
                                child:Row(
                                  children: [
                                    Expanded(
                                      child: Text('시간',
                                        style: TextStyle(
                                          fontSize: 12.0.sp,
                                          color: Color(0xff737373)
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                      flex: 57,
                                    ),
                                    Expanded(
                                      child: Text('가격',
                                        style: TextStyle(
                                            fontSize: 12.0.sp,
                                            color: Color(0xff737373)
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                      flex: 205,
                                    ),
                                    Expanded(
                                      child: Text('수량',
                                        style: TextStyle(
                                            fontSize: 12.0.sp,
                                            color: Color(0xff737373)
                                        ),
                                        textAlign: TextAlign.end,
                                      ),
                                      flex: 120,
                                    )
                                  ],
                                )
                              ),      /// 시간, 가격, 수량 고정 헤더
                              Container(
                                height: 230,
                                padding: EdgeInsets.symmetric(horizontal: 16.0.w),
                                child: ListView.builder(
                                  itemCount: 5,
                                  physics: NeverScrollableScrollPhysics(),
                                  itemBuilder: (BuildContext context,int index){
                                    return Container(
                                        height: 46,
                                        width: width-32.w,
                                        decoration: BoxDecoration(
                                            border: Border(
                                                bottom: BorderSide(
                                                    width: 1,
                                                    color: Color(0xffECEFF1)
                                                )
                                            )
                                        ),
                                        child:Row(
                                          children: [
                                            Expanded(
                                              child: Text('18:15:02',
                                                style: TextStyle(
                                                    fontSize: 14.0.sp,
                                                    color: Color(0xff737373)
                                                ),
                                                textAlign: TextAlign.left,
                                              ),
                                              flex: 123,
                                            ),
                                            Expanded(
                                              child: Text('46,379,000',
                                                style: TextStyle(
                                                    fontSize: 14.0.sp,
                                                    color: Color(0xffD8352C),
                                                    fontWeight: FontWeight.bold
                                                ),
                                                textAlign: TextAlign.end,
                                              ),
                                              flex: 139,
                                            ),
                                            Expanded(
                                              child: Text('0.000543',
                                                style: TextStyle(
                                                    fontSize: 14.0.sp,
                                                    color: Color(0xff737373)
                                                ),
                                                textAlign: TextAlign.end,
                                              ),
                                              flex: 120,
                                            )
                                          ],
                                        )
                                    );
                                  }
                                ),
                              ),       /// 체결, 일별 순에 따른 체결리스트
                              InkWell(
                                child: Container(
                                  height: 46,
                                  padding: EdgeInsets.symmetric(vertical: 13.0.w),
                                  child: Text('더 보기',style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0.sp
                                  ),),
                                ),
                                onTap:(){}
                              )         /// 더 보기
                            ]),
                      ) ,         /// 시세
                      SizedBox(height: 10,),
                      CoinInfo(),             /// 코인 정보
                      SizedBox(height: 10,),
                      OrderInfo(),
                      SizedBox(height: 110,)
                    ],
                  )));
        }));
  }

  Widget TapText(int op, String text, int flex) {
    return Expanded(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 0.0),
          //width: ,
          child: TextButton(
            child: Text(
              '$text',
              maxLines: 1,
              style: TextStyle(
                fontSize: 13.0.sp,
                fontWeight:
                    op == _tradeIdx ? FontWeight.bold : FontWeight.normal,
                color: op == _tradeIdx ? Color(0xffD8352C) : Colors.black,
              ),
            ),
            onPressed: () {
              setState(() {
                _tradeIdx = op;
                if(_tradeIdx==3) {
                  _scrollController.animateTo(
                      _scrollController.position.maxScrollExtent,
                      duration: Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn);
                  _tradeIdx = 0;
                }
              });
            },
          ),
          decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 2,
                      color: op == _tradeIdx
                          ? Color(0xffD8352C)
                          : Colors.transparent))),
        ),
        flex: flex);
  }/// 매수, 매도, 미체결, 주문정보 선택

  Widget TradeTap(int _tradeIdx) {
    if (_tradeIdx == 0)
      return MaesuWidget();
    else if (_tradeIdx == 1)
      return MaedoWidget();
    else if (_tradeIdx == 2)
      return UnclearedTradeWidget();
    else{
        _tradeIdx=0;
        return Container();
    }

  }     /// 매수, 매도, 미체결, 주문정보 선택에 따른 Widget return

  Widget SiseSortTapText(int op, String text) {
    return TextButton(
      child: Text(
        '$text',
        style: TextStyle(
            color: _siseSortIdx == op ? Colors.black : Color(0xff737373),
            fontSize: 14.0.sp,
            fontWeight:
                _siseSortIdx == op ? FontWeight.bold : FontWeight.normal),
        textAlign: TextAlign.end,
      ),
      onPressed: () {
        setState(() {
          _siseSortIdx = op;
        });
      },
    );
  }   /// 체결순, 일별순 탭

  List<UnicornButton> FloatingButtonItems(BuildContext context, ScrollController _scrollController){
    var childButtons = <UnicornButton>[];

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelBackgroundColor: Colors.transparent,
        labelHasShadow: false,
        labelColor: Colors.white,
        labelText: "호가",
        currentButton: FloatingActionButton(
          heroTag: "hoga",
          backgroundColor: Color(0xffFFBC00),
          mini: true,
          child: SvgPicture.asset('images/FloatingIcon/icon_hoga.svg'),//Icon(Icons.home),
          onPressed: () {
            setState(() {
              _scrollController.animateTo(0.0, duration: Duration(seconds:1), curve:Curves.fastOutSlowIn);
            });
          },
        )));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelBackgroundColor: Colors.transparent,
        labelHasShadow: false,
        labelColor: Colors.white,
        labelText: "차트",
        currentButton: FloatingActionButton(
            heroTag: "chart",
            backgroundColor: Color(0xffFFBC00),
            mini: true,
            onPressed: () {
              setState(() {
                _scrollController.animateTo(730.0, duration: Duration(seconds:1), curve:Curves.fastOutSlowIn);
              });
            },
            child: SvgPicture.asset('images/FloatingIcon/icon_chart.svg'))));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelBackgroundColor: Colors.transparent,
        labelHasShadow: false,
        labelColor: Colors.white,
        labelText: "보유 코인 현황",
        currentButton: FloatingActionButton(
            heroTag: "coin",
            backgroundColor: Color(0xffFFBC00),
            mini: true,
            onPressed: () {
              setState(() {
                _scrollController.animateTo(1330.0, duration: Duration(seconds:1), curve:Curves.fastOutSlowIn);
              });
            },
            child: SvgPicture.asset('images/FloatingIcon/icon_havingCoin.svg'))));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelBackgroundColor: Colors.transparent,
        labelHasShadow: false,
        labelColor: Colors.white,
        labelText: "시세",
        currentButton: FloatingActionButton(
            heroTag: "sise",
            backgroundColor: Color(0xffFFBC00),
            mini: true,
            onPressed: () {
              setState(() {
                _scrollController.animateTo(1680.0, duration: Duration(seconds:1), curve:Curves.fastOutSlowIn);
              });
            },
            child: SvgPicture.asset('images/FloatingIcon/icon_sise.svg'))));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelBackgroundColor: Colors.transparent,
        labelHasShadow: false,
        labelColor: Colors.white,
        labelText: "코인정보",
        currentButton: FloatingActionButton(
            heroTag: "coininfo",
            backgroundColor: Color(0xffFFBC00),
            mini: true,
            onPressed: () {
              setState(() {
                _scrollController.animateTo(2050.0, duration: Duration(seconds:1), curve:Curves.fastOutSlowIn);
              });
            },
            child:SvgPicture.asset('images/FloatingIcon/icon_coinInfo.svg'))));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelBackgroundColor: Colors.transparent,
        labelHasShadow: false,
        labelColor: Colors.white,
        labelText: "주문정보",
        currentButton: FloatingActionButton(
            heroTag: "orderinfo",
            backgroundColor: Color(0xffFFBC00),
            mini: true,
            onPressed: () {
              setState(() {
                _scrollController.animateTo(_scrollController.position.maxScrollExtent, duration: Duration(seconds:1), curve:Curves.fastOutSlowIn);
              });
            },
            child: SvgPicture.asset('images/FloatingIcon/icon_orderInfo.svg'))));

    childButtons.add(UnicornButton(
        hasLabel: true,
        labelBackgroundColor: Colors.transparent,
        labelHasShadow: false,
        labelColor: Colors.white,
        labelText: "뒤로가기",
        currentButton: FloatingActionButton(
          heroTag: "back",
          backgroundColor: Color(0xffFFBC00),
          mini: true,
          child: SvgPicture.asset('images/FloatingIcon/icon_back.svg'),//Icon(Icons.home),
          onPressed: () {
            setState(() {
              Navigator.pop(context);
            });
          },
        )));
    return childButtons;
  }   /// floatingButtons setState animation으로 화면을 offset 위치로 강제 이동
}

