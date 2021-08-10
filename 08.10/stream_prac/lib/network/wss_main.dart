// CopyrisvcHeadert (c) 2018, the Dart project authors.  Please see the AUTHORS file
// for details. All risvcHeaderts reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

//import 'dart:ffi';

//import 'dart:ffi';

import 'package:provider/provider.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/status.dart' as status;
import 'dart:typed_data';
import 'dart:io';
import 'dart:async';
import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:archive/archive.dart';
import 'package:archive/archive_io.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../serviceio/globalSGA.dart';
import '../serviceio/svcheader.dart';
import '../serviceio/unitsvctest.dart';
import '../serviceio/svc20003.dart';
import '../serviceio/svc50009.dart';
import '../serviceio/svc66122.dart';


void gSsoSvc(String firstSsoYn)
{
  SvcHeader svcHeader     = SvcHeader();

  gRequst.clear();

  UsrSvc20003 usrSvc20003 = UsrSvc20003();
  usrSvc20003.makeUsrSvc20003(usid: gGlobalSGA.userId, encryptPswd: gGlobalSGA.encryptPswd, jsonYn: 'Y', firstSsoYn: firstSsoYn);
  gRequst.add(svcHeader.setSvcHeader(usrSvc20003.requestData(), usrSvc20003.svcCode, gGlobalSGA.getRequestSeq()));
  gRequst.add(usrSvc20003.requestData());

  gChannel.sink.add(gRequst.toBytes());
}

void wssSsoSvc(String callType)
{
  SvcHeader svcHeader     = SvcHeader();

  debugPrint('wssSsoSvc');

  gRequst.clear();

  // 종목 마스터 호출
  UsrSvc66122 usrSvc66122 = UsrSvc66122();
  usrSvc66122.makeUsrSvc66122(hvGb: '8', jsonYn: 'Y' );
  gRequst.add(svcHeader.setSvcHeader(usrSvc66122.requestData(), usrSvc66122.svcCode, gGlobalSGA.getRequestSeq()));
  gRequst.add(usrSvc66122.requestData());

  gChannel.sink.add(gRequst.toBytes());

  // 로그인
  if (callType == 'test') {
    gSsoSvc('Y');
  }

  if (callType == 'test') {
    gRequst.clear();

    // 리얼 등록 종목 만들기
    //8192 , 4096 => 12288
    UsrSvc50009 usrSvc50009 = UsrSvc50009();
    if (true) {
      usrSvc50009.makeUsrSvc50009(type: 'S', isRegister: 'Y', dataKey: 'ETH/KRW', attr: '00008193');
      usrSvc50009.makeUsrSvc50009(type: 'S', isRegister: 'Y', dataKey: 'BTC/KRW', attr: '00008193');
      usrSvc50009.makeUsrSvc50009(type: 'S', isRegister: 'Y', dataKey: 'BUZ/KRW', attr: '00008193');
    }

    usrSvc50009.makeUsrSvc50009(type : 'A', isRegister: 'Y', dataKey: gGlobalSGA.userId, attr: '00000004');
    usrSvc50009.makeUsrSvc50009(type : 'A', isRegister: 'Y', dataKey: '00000000808', attr: '00000008');

    // 리얼 등록 요청
    gRequst.add(svcHeader.setSvcHeader(usrSvc50009.requestData(), usrSvc50009.svcCode, gGlobalSGA.getRequestSeq()));
    gRequst.add(usrSvc50009.requestData());
    gChannel.sink.add(gRequst.toBytes());
  }

  gRequst.clear();

}


bool onDataProc( SvcHeader svcHeader, dynamic streamBody)
{
  try {
    //if (svcHeader.contentType != 'J') { // json 아닌 svc
      debugPrint('svc ${svcHeader.svc}> body> ' + streamBody);
    //}
    gGlobalSGA.responseData = streamBody;
  } catch(e) {
    debugPrint('error: ' + svcHeader.svc.toString() + '> ' + e.toString());
    return false;
  }

  if (svcHeader.contentType == 'J') { // json
    try {
      late Map strBodyJson = jsonDecode(streamBody);

      if (svcHeader.svc == 66122) { // 종목 마스터

        gGlobalSGA.parseMastTable(strBodyJson);

        return false;
      } else if (svcHeader.svc == 51015) {
        if (gStreamCtrlHoga.hasListener) {
          gStreamCtrlHoga.add(streamBody);
        } else {
          debugPrint('gStreamCtrl.listener.for.hoga -> not found...');
        }
        
        return true;
      }
      else if (svcHeader.svc == 20003) {
        gGlobalSGA.parseAccnList(strBodyJson);
        svcLogonAckProc(svcHeader);
        return true;
      } else {              // 일반 json View
        strBodyJson.forEach((key, value) { debugPrint('$key : $value');});
      }
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }

  } else { // structure view

    if (svcHeader.svc == 51012) { // 체결 호가
      if (gStreamCtrlSise.hasListener) {
        gStreamCtrlSise.add(streamBody);
      } else {
        debugPrint('gStreamCtrl.listener.for.sise -> not found...');
      }
      return false;

    } else if (svcHeader.svc == 53000) {
      var msg = '';
      var code = '';

      gGlobalFIP.parseData(streamBody);

      code = gGlobalFIP.code;

      if (gGlobalFIP.gubn == '2110') {
        msg = code + ', ${gGlobalFIP.conclsnQty} x ${gGlobalFIP.conclsnPrc} ${gGlobalFIP.ordNo} ${gGlobalFIP.slby == '1' ? '매도' : '매수'}체결';
      } else if (gGlobalFIP.gubn == '2320') {
        msg = code + ', ${gGlobalFIP.conclsnQty} x ${gGlobalFIP.conclsnPrc} ${gGlobalFIP.ordNo} ${gGlobalFIP.slby == '1' ? '매도' : '매수'}취소';
      } else if (gGlobalFIP.gubn == '1100') {
        msg = code + ', ${gGlobalFIP.conclsnQty} x ${gGlobalFIP.conclsnPrc} ${gGlobalFIP.ordNo} ${gGlobalFIP.slby == '1' ? '매도' : '매수'}주문 접수';
      } else {
        msg = '처리 중:' + gGlobalFIP.gubn;
      }

      Fluttertoast.showToast(
          msg: msg,
        //  toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 8.0
      );

      return false;
    } else if (svcHeader.svc == 52000) {
      gGlobalAdmMsg.parseData(streamBody);
      return false;
    }else if(svcHeader.svc==106122){
      if (gStreamCtrlSvc.hasListener) {
        print('${jsonDecode(streamBody).toString()}');
        gStreamCtrlSvc.add(streamBody);
      } else {
        debugPrint('gStreamCtrl.listener.for.hoga -> not found...');
      }

      return true;
    }
  }

  return true;
}

void svcLogonAckProc(SvcHeader svcHeader)
{
  // 로그인 응답이 오면 서버에 리얼 등록처리한다.
  if (svcHeader.svc == 20003)
  {
      gRequst.clear();

      gGlobalSGA.setSsoStatus('sso'); // sso 상태..

      // 로그인 응답으로, 리얼 등록 종목 만들기
      UsrSvc50009 usrSvc50009 = UsrSvc50009();

      if (false) {
        usrSvc50009.makeUsrSvc50009(type: 'S', isRegister: 'Y', dataKey: 'ETH/KRW', attr: '00008193');
        usrSvc50009.makeUsrSvc50009(type: 'S', isRegister: 'Y', dataKey: 'BTC/KRW', attr: '00008193');
        usrSvc50009.makeUsrSvc50009(type: 'S', isRegister: 'Y', dataKey: 'BUZ/KRW', attr: '00008193');
      }

      usrSvc50009.makeUsrSvc50009(type : 'A', isRegister: 'Y', dataKey: gGlobalSGA.userId, attr: '00000004');
      usrSvc50009.makeUsrSvc50009(type : 'A', isRegister: 'Y', dataKey: gGlobalSGA.vAccn, attr: '00000008');

      // 리얼 등록 요청
      gRequst.add(svcHeader.setSvcHeader(usrSvc50009.requestData(), usrSvc50009.svcCode, gGlobalSGA.getRequestSeq()));
      gRequst.add(usrSvc50009.requestData());
      gChannel.sink.add(gRequst.toBytes());

  }

}

void gOnData(message)
{

  // dynamic list<int> var..

  var recvstreamBody;// = [];
  int realSiseJsonOffset = 0;
  SvcHeader svcHeader     = SvcHeader();

  //Uint8List recvstream = Uint8List.fromList(message);
  //Uint8List recvstream = message as Uint8List;
  //Uint8List recvstream = Uint8List.sublistView(message);

  Uint8List recvstream1 = message as Uint8List;
  Uint8List recvstream  = recvstream1.sublist(0, recvstream1.length);

  svcHeader.parseData(recvstream.buffer);
  svcHeader.fieldPrint();

  realSiseJsonOffset = 0;
  if (51000 <= svcHeader.svc && svcHeader.svc <= 51100) {
    if (svcHeader.contentType == 'J') {
      realSiseJsonOffset = 4;
    } else {
    }
  } else {
  }

  if (svcHeader.len > 0) {         // body 존재
    if (svcHeader.compr == 0x02) { // 압축데이타
      try {
        // 압축 해제시 앞에 2바이트하고 뒤에 4바이트가 끼어드는데, Inflate에서 바로 처리가 안되네..
        var _recvstreamBody = Inflate(Uint8List.view(recvstream.buffer, svcHeader.ghSize + 2)).getBytes();
        //recvstreamBody  = String.fromCharCodes(utf8.decode(_recvstreamBody as List<int>).codeUnits);

        recvstreamBody = utf8.decode(_recvstreamBody);

      } catch (e) {
        debugPrint('svc ' + svcHeader.svc.toString() + '> body(1).compr0x02.except: ' + e.toString());
        return;
      }
    } else {  // 비압축데이타

      try {
       // 포멧에 utf8인 자료가 아닐떄 exception이 뜸..
        if (41000 <= svcHeader.svc && svcHeader.svc <= 45000) { // 주문응답
          recvstreamBody = String.fromCharCodes(Uint8List.view(recvstream.buffer, svcHeader.ghSize + realSiseJsonOffset));
        } else {
          recvstreamBody = utf8.decode(Uint8List.view(recvstream.buffer, svcHeader.ghSize + realSiseJsonOffset));
        }

      } catch (e) {
       // debugPrint(recvstream.buffer);
       // debugPrint('body(1).compr0x00:  ' + svcHeader.svc.toString() + ',' + svcHeader.ghSize.toString() + ',' +  realSiseJsonOffset.toString() + ',' + recvstream.buffer.lengthInBytes.toString());
        debugPrint('svc ' + svcHeader.svc.toString() + '> body(1).compr0x00:  ' + e.toString());
        return;
      }
    }

    if (recvstreamBody == null) {
      debugPrint('svc ' + svcHeader.svc.toString() + '> %%%%%% recvstreamBody is null %%%%%%%%');
    } else {
      if (onDataProc(svcHeader, recvstreamBody) == true) {
        UsrSvcObject usrSvcObject = UsrSvcObject();
        usrSvcObject.updateResponse(svcHeader, recvstreamBody);
        gStreamCtrlSvc.add(usrSvcObject);
      }
    }
  } else {          // body 없음 (헤더만 존재)

    //debugPrint('svc ' + svcHeader.svc.toString() + '> body(3)  > : body is 0');

    if (svcHeader.svc == 2 || svcHeader.svc == 50009) { // hearbeat, rtsregister skip..

    } else if (svcHeader.svc == 20) {
      gGlobalSGA.setSsoStatus('sise'); // sso 상태..
    } else {
      UsrSvcObject usrSvcObject = UsrSvcObject();
      usrSvcObject.updateResponse(svcHeader, "{}");
      gStreamCtrlSvc.add(usrSvcObject);
    }
  }

}

void gListenWss(String callType) {

  debugPrint('listenWs..:' + callType);

  gChannel.stream.listen(( message) {
               gOnData(message);},
      onDone : gOnDone,
      onError: gOnError
  );
}

void gWssReConnect(String callType)
{
  //final token = prefs.token;

  Future.delayed(Duration(seconds: 3)).then((_){

    gChannel = WebSocketChannel.connect(Uri.parse(gGlobalSGA.getWsUrl()));

    // 시세 로그인
    // 이미 로그인 상태이면 자동 로그인 처리..
    if (gGlobalSGA.isSsoStatus == 'sso') {
      gSsoSvc('N');
    } else {
      gSiseSSO();
    }

    gListenWss('websocket.reconnect:' + callType);

  });

}

void gHeartBeat(String callType)
{
  Timer.periodic(Duration(seconds: 30), (timer) {
    // 하트비트 전송..
    try {
      gRequst.clear();
      SvcHeader svcHeader     = SvcHeader();
      gRequst.add(svcHeader.setSvcHeader(null, 2, gGlobalSGA.getRequestSeq()));
      gChannel.sink.add(gRequst.toBytes());
    } catch (e) {
      debugPrint('heartbeat.exception>' + callType + ' >' + e.toString());
    }
  });

}

void gSiseSSO()
{
    int seq = gGlobalSGA.getRequestSeq();
    SvcHeader svcHeader     = SvcHeader();

    gRequst.clear();
    gRequst.add(svcHeader.setSvcHeader(null, 20, seq));
    gChannel.sink.add(gRequst.toBytes());

    debugPrint('svc 20>' + ', seq: ' + seq.toString());

  //  gGlobalSGA.requestSvcMap.addEntries();
}

void gOnDone () {
  debugPrint('onDone: closeCode: ' + gChannel.closeCode.toString() );
  gWssReConnect('By listen.onDone');
}

void gOnError (e, s) {
  //debugPrint('onError: ' + gChannel.closeCode.toString() + ', ' + gChannel.closeReason);
  //debugPrint('onError:' + gChannel.closeCode.toString() + ',' + e.toString());
  WebSocketChannelException ex = e;
  debugPrint('onError:' + ex.message.toString());
}


dynamic wssConnect(String callType)
{
  debugPrint('connect try... :' + gGlobalSGA.getWsUrl());

  gChannel =  WebSocketChannel.connect(Uri.parse(gGlobalSGA.getWsUrl()));

  debugPrint('connected...');

  // 시세 로그인
  gSiseSSO();

  return gChannel;
}

// main에서 직접 테스트할때 entry main
void WssMainTest()
{
  // server init...
  wssConnect('test');

  // 로그인 서비스
  wssSsoSvc('test');

  // 기타 io test
  unitSvcTest('test');
/*
  unitSvcTest('2');
  unitSvcTest('2');
*/

  // heartbeat
  gHeartBeat('test');

  gListenWss('test');

}

