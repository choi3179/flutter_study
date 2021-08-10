
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:unicorndial/unicorndial.dart';

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
          _animateToIndex() {
            setState(){
              _scrollController.animateTo(0.0, duration: Duration(seconds:1), curve:Curves.fastOutSlowIn);
            }
          }
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
          onPressed: () {  },
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
          onPressed: () {  },
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
          onPressed: () {  },
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
          onPressed: () {  },
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
          onPressed: () {  },
          child: SvgPicture.asset('images/FloatingIcon/icon_orderInfo.svg'))));

  return childButtons;
}