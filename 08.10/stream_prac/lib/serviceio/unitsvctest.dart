// CopyrigHeadert (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All rigHeaderts reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

//import 'dart:ffi';

//import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';

import 'globalSGA.dart';
import 'svcheader.dart';
import 'svc20003.dart';
import 'svc50009.dart';
import 'svc66122.dart';
import 'svc17131.dart';
import 'svc16111.dart';
import 'svc102032.dart';
import 'svc106122.dart';
import 'svc105112.dart';
import 'svc102028.dart';
import 'svc17214.dart';
import 'svc16123.dart';
import 'svc17218.dart';
import 'svc17903.dart';
import 'svc17226.dart';
import 'svc17227.dart';
import 'svc18103.dart';
import 'svc18106.dart';
import 'svc66131.dart';
import 'svc16118.dart';
import 'svc16119.dart';
import 'svc77622.dart';
import 'svc77623.dart';
import 'svc77624.dart';
import 'svc16311.dart';
import 'svcorder.dart';
import 'httpsession.dart';
import 'package:dio/dio.dart';

import 'provider.dart';

dynamic httpTest(String url) async {
  HttpSession httpSession = HttpSession();

  var response = await httpSession.get(url);

  if (response == null) {
    print('response:fail.. : ' + httpSession.statusCode.toString());
  } else {
    if (response is List<dynamic>) {
      print('response is list, ' + url);
    } else {
      print('response is map,  ' + url);
    }

    // print(response.runtimeType.toString());

    print('response: ' + response.toString());
  }

  return response;
}

dynamic dioTest(String url) async {
  Response response;
  var options = Options(
      sendTimeout: 5000,
      receiveTimeout: 5000
  );

  var dio = Dio();

  //response = await dio.get(url );
  //print(response.data.toString());

  try {
    response = await dio.get(url, options: options);
    print(response.data.toString());
    return response.data;
  } on DioError catch(e) {
    print(e.message);
  } catch(e) {
    //print(DioErrorType.response.toString());
    print('dio.exception: ' + e.toString());
  }
}


void unitSvcTest(String callType)
{
  int seq;
  SvcHeader gHeader     = SvcHeader();

  gRequst.clear();

  if (callType == 'test' || callType == '2') {
    // hertbeat..
    // 2
    seq = gGlobalSGA.getRequestSeq();
    gRequst.add(gHeader.setSvcHeader(null, 2, seq));
    gChannel.sink.add(gRequst.toBytes());

    debugPrint('svc 2>' + ', seq:' + seq.toString() + ', hashCode:');
  }

  gRequst.clear();

  if (callType == '20003') {
    UsrSvc20003 usrSvc20003 = UsrSvc20003();
   // usrSvc20003.makeUsrSvc20003(encryptPswd: gGlobalSGA.encryptPswd);
    usrSvc20003.makeUsrSvc20003(usid: gGlobalSGA.userId, encryptPswd: gGlobalSGA.encryptPswd, jsonYn: 'Y');
    //print('password: ' + gGlobalSGA.encryptPswd);
    gRequst.add(gHeader.setSvcHeader(usrSvc20003.requestData(), usrSvc20003.svcCode, gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc20003.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();

  if (callType == 'test' || callType == '17131') {
    //17131
    UsrSvc17131 usrSvc17131 = UsrSvc17131();
    usrSvc17131.makeUsrSvc17131(vAccn: '00000000808', code: 'BTC/KRW');
    gRequst.add(gHeader.setSvcHeader(usrSvc17131.requestData(), usrSvc17131.svcCode, gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc17131.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();

  //if (true) {
  if (callType == 'test' || callType == '16111') {
    UsrSvc16111 usrSvc16111 = UsrSvc16111();
    usrSvc16111.makeUsrSvc16111(gb: '1', userId: gGlobalSGA.userId, jsonYn: 'Y');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc16111.requestData(), usrSvc16111.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc16111.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();

  if (callType == 'test' || callType == '102032') { // 102032
    UsrSvc102032 usrSvc102032 = UsrSvc102032();
    usrSvc102032.makeUsrSvc102032(code: 'ETH/KRW');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc102032.requestData(), usrSvc102032.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc102032.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();

  if (callType == 'test' || callType == '106122') { // 106122
    UsrSvc106122 usrSvc106122 = UsrSvc106122();
    usrSvc106122.makeUsrSvc106122(gb: 'J', coinCurrency: 'KRW');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc106122.requestData(), usrSvc106122.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc106122.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();


  if (callType == 'test' || callType == '105112') { // 105112
    UsrSvc105112 usrSvc105112 = UsrSvc105112();
    usrSvc105112.makeUsrSvc105112(gb: '0', code: 'ETH/KRW', jsonYn: 'Y');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc105112.requestData(), usrSvc105112.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc105112.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

    gRequst.clear();


  if (callType == 'test' || callType == '102028') { // 102028
    UsrSvc102028 usrSvc102028 = UsrSvc102028();
    usrSvc102028.makeUsrSvc102028(code: 'ETH/KRW',
        gigan: '0500',
        nBun: '001',
        buttonGb: '1',
        jsonYn: 'Y');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc102028.requestData(), usrSvc102028.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc102028.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

    gRequst.clear();


  if (callType == 'test' || callType == '17214') { // 17214
    UsrSvc17214 usrSvc17214 = UsrSvc17214();
    usrSvc17214.makeUsrSvc17214(vAccn: '00000000808',
        code: 'ETH/KRW',
        jqtyYn: 'Y',
        assetYn: 'Y',
        jsonYn: 'Y');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc17214.requestData(), usrSvc17214.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc17214.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

    gRequst.clear();


  if (callType == 'test' || callType == '16123') { // 16123
    UsrSvc16123 usrSvc16123 = UsrSvc16123();
    usrSvc16123.makeUsrSvc16123(vAccn: '00000000808',
        code: '',
        krwYn: 'Y',
        dtFr: '20210701',
        dtTo: '20210707');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc16123.requestData(), usrSvc16123.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc16123.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();

  if (callType == 'test' || callType == '17218') { // 17218
    UsrSvc17218 usrSvc17218 = UsrSvc17218();
    usrSvc17218.makeUsrSvc17218(
        vAccn: '00000000808', code: 'ETH/KRW', jsonYn: 'Y');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc17218.requestData(), usrSvc17218.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc17218.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();

  if (callType == 'test' || callType == '17903') { // 17903
    UsrSvc17903 usrSvc17903 = UsrSvc17903();
    usrSvc17903.makeUsrSvc17903(gb: 'J', vAccn: '00000000808', code: 'ETH/KRW');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc17903.requestData(), usrSvc17903.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc17903.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

   gRequst.clear();

  if (callType == 'test' || callType == '17227') { // 17227
    UsrSvc17227 usrSvc17227 = UsrSvc17227();
    usrSvc17227.makeUsrSvc17227(
        vAccn: '00000000808', dtFr: '20210701', dtTo: '20210707', jsonYn: 'Y');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc17227.requestData(), usrSvc17227.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc17227.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }
    gRequst.clear();

  if (callType == 'test' || callType == '17226') { // 17226
    UsrSvc17226 usrSvc17226 = UsrSvc17226();
    usrSvc17226.makeUsrSvc17226(
        vAccn: '00000000808', dtFr: '20210701', dtTo: '20210707');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc17226.requestData(), usrSvc17226.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc17226.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }
    gRequst.clear();

  if (callType == 'test' || callType == '18103') { // 18103
    UsrSvc18103 usrSvc18103 = UsrSvc18103();
    usrSvc18103.makeUsrSvc18103(
        vAccn: '00000000808', dtFr: '20210701', dtTo: '20210707', jsonYn: 'Y');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc18103.requestData(), usrSvc18103.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc18103.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }
    gRequst.clear();

  if (callType == 'test' || callType == '18106') { // 18106
    UsrSvc18106 usrSvc18106 = UsrSvc18106();
    usrSvc18106.makeUsrSvc18106(
        vAccn: '00000000808', dtFr: '20210701', dtTo: '20210707', jsonYn: 'Y');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc18106.requestData(), usrSvc18106.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc18106.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

    gRequst.clear();

  if (callType == 'test' || callType == '66131') { // 66131
    UsrSvc66131 usrSvc66131 = UsrSvc66131();
    usrSvc66131.makeUsrSvc66131(jsonYn: 'Y');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc66131.requestData(), usrSvc66131.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc66131.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }
    gRequst.clear();

  if (callType == 'test' || callType == '16118') { // 16118
    UsrSvc16118 usrSvc16118 = UsrSvc16118();
    usrSvc16118.makeUsrSvc16118(vAccn: '00000000808',
        jikb: '1',
        aek: '12300',
        bigo: 'test',
        userId: gGlobalSGA.userId);
    gRequst.add(gHeader.setSvcHeader(
        usrSvc16118.requestData(), usrSvc16118.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc16118.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

    gRequst.clear();

  if (callType == 'test' || callType == '16119') { // 16119
    UsrSvc16119 usrSvc16119 = UsrSvc16119();
    usrSvc16119.makeUsrSvc16119(gb: '5',
        vAccn: '00000000808',
        userId: gGlobalSGA.userId,
        aek: '1200',
        code: 'BUZ/KRW',
        bcCode: 'KLAY/KRW',
        othNioc: '0xtest',
        verifyType: 'Z',
        bigo: 'test');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc16119.requestData(), usrSvc16119.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc16119.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();

  if (callType == 'test' || callType == '77622') { // 77622
    UsrSvc77622 usrSvc77622 = UsrSvc77622();
    usrSvc77622.makeUsrSvc77622(
        userId: gGlobalSGA.userId, code: 'BUZ/KRW', vAccn: '00000000808');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc77622.requestData(), usrSvc77622.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc77622.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

    gRequst.clear();

  if (callType == 'test' || callType == '77623') { // 77623
    UsrSvc77623 usrSvc77623 = UsrSvc77623();
    usrSvc77623.makeUsrSvc77623(userId: gGlobalSGA.userId,
      bcCode: 'KLAY/KRW',
      code: 'BUZ/KRW',
      vAccn: '00000000808',);
    gRequst.add(gHeader.setSvcHeader(
        usrSvc77623.requestData(), usrSvc77623.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc77623.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

    gRequst.clear();

  if (callType == 'test' || callType == '77624') { // 77624
    UsrSvc77624 usrSvc77624 = UsrSvc77624();
    usrSvc77624.makeUsrSvc77624(
        userId: gGlobalSGA.userId, code: 'BUZ/KRW', othNioc: '0x111');
    gRequst.add(gHeader.setSvcHeader(
        usrSvc77624.requestData(), usrSvc77624.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc77624.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }
  //}

  gRequst.clear();

  if (callType == 'test' || callType == '41065') { // 41065 매수
    UsrSvcOrder usrSvcOrder = UsrSvcOrder();
    usrSvcOrder.makeUsrSvcOrder(userId: gGlobalSGA.userId,
      vAccn: '00000000808',
      code: 'BUZ/KRW',
      ordType: '2',
      slby: '1',
      ordQty: '300',
      ordPrice: '0',);
    gRequst.add(gHeader.setSvcHeader(
        usrSvcOrder.requestData(), usrSvcOrder.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvcOrder.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();

  if (callType == 'test' || callType == '41066') { // 매도
    // 41065, 41066
    UsrSvcOrder usrSvcOrder = UsrSvcOrder();
    usrSvcOrder.makeUsrSvcOrder(userId: gGlobalSGA.userId,
      vAccn: '00000000808',
      code: 'BUZ/KRW',
      ordType: '1',
      slby: '1',
      ordQty: '300',
      ordPrice: '0',);
    gRequst.add(gHeader.setSvcHeader(
        usrSvcOrder.requestData(), usrSvcOrder.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvcOrder.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();

  if (callType == 'test' || callType == '41067') {   // 41067 취소
    UsrSvcOrderCancel usrSvcOrderCancel = UsrSvcOrderCancel();
    usrSvcOrderCancel.makeUsrSvcOrderCancel(userId: gGlobalSGA.userId,
        vAccn: '00000000808',
        code: 'BUZ/KRW',
        orgPrefixOrdNo: '202107031717',
        orgOrdNo: '714420');
    gRequst.add(gHeader.setSvcHeader(
        usrSvcOrderCancel.requestData(), usrSvcOrderCancel.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvcOrderCancel.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();

  if (callType == 'test' || callType == '16311') { // 16311
    UsrSvc16311 usrSvc16311 = UsrSvc16311();
    usrSvc16311.makeUsrSvc16311(gb: 'J', userId: gGlobalSGA.userId);
    gRequst.add(gHeader.setSvcHeader(
        usrSvc16311.requestData(), usrSvc16311.svcCode,
        gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc16311.requestData());

    gChannel.sink.add(gRequst.toBytes());
  }
  //
}


