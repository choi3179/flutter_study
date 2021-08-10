import 'dart:io';
import 'dart:typed_data';
import 'dart:async';
import 'dart:convert';
import 'package:crypto/crypto.dart';

import '../serviceio/svcheader.dart';

late GlobalSGA  gGlobalSGA = GlobalSGA();
late GlobalFIP  gGlobalFIP = GlobalFIP();
late GlobalAdmMsg gGlobalAdmMsg = GlobalAdmMsg();


// wss stream
var gChannel;

// request용 builder..
BytesBuilder gRequst = BytesBuilder();

// 비동기 stream
StreamController gStreamCtrlHoga = StreamController.broadcast();
StreamController gStreamCtrlSise = StreamController.broadcast();
StreamController gStreamCtrlSvc  = StreamController.broadcast();

class UsrSvcObject
{
    // for timeout check
    var requestTime = DateTime.now();

    // reqest info
    int responseSvc = 0;
    int responseSeq = 0;

    // response info
    SvcHeader responseHeader = SvcHeader();
    dynamic responseSvcObject;

    updateResponse(SvcHeader oresponseHeader, dynamic oresponseBody)
    {
        responseSvc       = oresponseHeader.svc;
        responseSeq       = oresponseHeader.seq;

        responseHeader    = oresponseHeader;
        responseSvcObject = oresponseBody;
    }

}

class GlobalSGA
{
    String userId = '';
    String nation = 'KR';
    String media  = 'M';
    String isSsoStatus = 'N'; // try => sise(20) => sso(20003)
    String encryptPswd = '';
    String isMode       = 'test'; // test, real
    // String testUrl    = 'wss://192.168.1.23:4999';
    String testUrl      = 'https://zzzzzhahatestserver.beeblock.co.kr';
    String testWsUrl    = 'ws://zzzzzhahatestserver.beeblock.co.kr:4999';
    String realUrl      = 'https://www.beeblock.co.kr';
    String realWsUrl    = 'wss://www.beeblock.co.kr:4999';

    int requestSeq = 1; // 요청 순번 (++)
    int debugLevl  = 1; // 1 debug, 2: info, 3:error.. working

    // for test mode
    dynamic responseData;

    // 종목 마스터
    List _mastTable = [];
    Map   mastTable = {};

    void setSsoStatus(String status)
    {
        isSsoStatus = status;
    }

    String getWsUrl()
    {
        if (isMode == 'test')
            return testWsUrl;

        return realWsUrl;
    }

    String getHttpUrl()
    {
        if (isMode == 'test')
            return testUrl;

        return realUrl;
    }

    void setMode(String mode)
    {
        if (mode == 'test' || mode == 'real') {
            isMode = mode;
        }
    }

    void setUserPswd(String usid, String pswd)
    {
        userId      = usid;
        encryptPswd = sha256.convert(utf8.encode(pswd)).toString();
        isSsoStatus = 'try';
    }

    void parseMastTable(dynamic responseMastTable)
    {
      //  mastTable = responseMastTable;

        mastTable.clear();

        if (responseMastTable.runtimeType is List) { // list type
            _mastTable = responseMastTable;
        } else {
            _mastTable = responseMastTable['cData'];
        }

        for (int x = 0; x < _mastTable.length; x++) {
           //print('$x > ' + mastTable[x]['code'] + ',' + mastTable[x]['hnam'] + ',' + mastTable[x]['curr']);
           mastTable.addAll({ _mastTable[x]['code'].toString() : _mastTable[x] });
        }
        if (false) {
            print(_mastTable.elementAt(3).toString());
            print(mastTable.keys.toString());
            print(mastTable['BUZ/KRW']);
            print(mastTable['BUZ/KRW']['curr']);
        }

      // print('------66122.1------');
        //print(mastTable.length);
       // mastTable.forEach((key, value) { print('$key : $value');});
       //print('------66122.2------');

    }

    // 계좌 정보
    Map accnList = {};

    String currency = 'KRW';
    String vAccn = '';
    String vAccnFuture = '';

    String usernm = '';
    int    levl = 0;
    String nick = '';
    int    flevl= 0;
    String leadingYn = 'N';
    int viewcd = 0;
    int payLevl = 0;
    String smartpayyn = 'N';
    String otpyn = 'N';
    String polyn = 'N';
    String stakingflevl = 'N';
    String kycgb = '';
    int specialflevl = 0;
    String bankYn = 'N';
    String mybankname = '';
    String mybankaccount = '';
    String myaccountname = '';

    void parseAccnList(Map responseAccnList)
    {
        accnList.clear();
        accnList = responseAccnList;

        gGlobalSGA.userId = responseAccnList['userid'];
        gGlobalSGA.usernm = responseAccnList['usnm'];
        gGlobalSGA.levl = int.parse(responseAccnList['levl']);
        gGlobalSGA.nick = responseAccnList['nick'];
        gGlobalSGA.flevl= 0;
        gGlobalSGA.leadingYn = responseAccnList['leading_yn'];
        gGlobalSGA.viewcd = 0;
        gGlobalSGA.payLevl = int.parse(responseAccnList['pay_levl']);
        gGlobalSGA.smartpayyn = responseAccnList['smart_pay_yn'];
        gGlobalSGA.otpyn = responseAccnList['otp_yn'];
        gGlobalSGA.polyn = 'N';
        gGlobalSGA.stakingflevl = 'N';
        gGlobalSGA.kycgb = responseAccnList['kyc_gb'];
        gGlobalSGA.specialflevl = 0;
        gGlobalSGA.bankYn = responseAccnList['bank_yn'];
        gGlobalSGA.mybankname = responseAccnList['my_bankname'];
        gGlobalSGA.mybankaccount = responseAccnList['my_bankaccount'];
        gGlobalSGA.myaccountname = gGlobalSGA.usernm;

        var cData = responseAccnList['cData'];
        for (int x = 0; x < cData.length; x++) {
            if (cData[x]['item_sect'] == '00') {
               // print('svc20003> $x > ' + cData[x]['v_accn'] + ',' + cData[x]['accn_type'] + ',' + cData[x]['currency'] + ',' + cData[x]['item_sect']);

                vAccn    = cData[x]['v_accn'];
                currency = cData[x]['currency'];
            }
        }

        if (false) {
            print('---20003----');
            print(userId);
            print(usernm);
            print(vAccn);
            print(mybankname);
            print(mybankaccount);
            print(myaccountname);
            print(payLevl);
            print('---20003----');
        }

    }

    int getRequestSeq ()
    {
        requestSeq ++;

        if (requestSeq <= 0)        requestSeq = 1;
        if (requestSeq >= 99999999) requestSeq = 1;

        return requestSeq;
    }

    void setDebugLevl(int debugLevl)
    {
        debugLevl = debugLevl;
    }
}

class GlobalFIP {
    late String ordNo;
    late String orgOrdNo;
    late String code;
    late double conclsnQty;
    late double conclsnPrc;
    late String conclsnTime;
    late String gubn;
    late String vAccn;
    late String slby;
    late String reject;
    late String itemSect;
    late String conclsnNo;
    late String ordType;
    late String ordSect;
    late String prefixOrdNo;
    late String orgPrefixOrdNo;
    late String userArea;
    late String userId;
    late String svc;
    late String utcTime;
    late String bbgb;
    late String stgb;
    late String marginGb;
    late String previousMmgb;

    late String afMmgb;
    late String afJqty;
    late String afPamt;
    late String afBrokenPrc;
    late String afMarginPrc;
    late String afMarginQty;
    late String afLeverage;

    late String loNearPrc;
    late String ikNearPrc;

    late String afCrossLeverage;
    late String coinMktYn;
    late String afCode;
    late String mktBaseCode;
    late String mktBaseMmgb;
    late String mktBaseJqty;
    late String mktBasePamt;
    late String avTot;
    late String triggerType;
    late String afMaintenanceMarginRt;
    late String afInitialMarginRt;
    late String afriskHandoQty;
    late String afMarketGb;
    late String afInsuranceStatus;
    late String afMdAbleQty;
    late String afPlSonik;
    late String afMsms;
    late String afMdms;
    late String afMsma;
    late String afMdma;
    late String marginPrice;
    late String afNetJqty;
    late String afNumOrderStls;
    late String plSonik;
    late String susuAek;
    late String leftOrdQty;
    late String ordQty;
    late String partnerLpYn;

    int  offSet = 0;

    String  _parseValue(String buffer, int valueSz)
    {
        int _offSet = offSet;
        offSet += valueSz;
        return buffer.substring(_offSet, _offSet + valueSz).trim();
    }

    void parseData(String buffer)
    {
        offSet = 0;
        ordNo    = _parseValue(buffer, 6);
        orgOrdNo = _parseValue(buffer, 6);
        code     = _parseValue(buffer, 15);
        conclsnQty = double.parse(_parseValue(buffer, 20));
        conclsnPrc = double.parse(_parseValue(buffer, 20));
        conclsnTime= _parseValue(buffer, 8);
        gubn = _parseValue(buffer, 4);

        vAccn = _parseValue(buffer, 12);
        slby  = _parseValue(buffer, 2);
        reject = _parseValue(buffer, 11);
        itemSect = _parseValue(buffer, 2);
        conclsnNo = _parseValue(buffer, 9);
        ordType = _parseValue(buffer, 3);
        ordSect = _parseValue(buffer, 1);
        prefixOrdNo = _parseValue(buffer, 15);
        orgPrefixOrdNo = _parseValue(buffer, 15);
        userArea = _parseValue(buffer, 20);
        userId = _parseValue(buffer, 60);
        svc = _parseValue(buffer, 4);
        utcTime = _parseValue(buffer, 13);
        bbgb = _parseValue(buffer, 1);
        stgb = _parseValue(buffer, 1);
        marginGb = _parseValue(buffer, 1);
        previousMmgb = _parseValue(buffer, 1);
        afMmgb = _parseValue(buffer, 1);
        afJqty = _parseValue(buffer, 21);
        afPamt = _parseValue(buffer, 21);
        afBrokenPrc = _parseValue(buffer, 21);
        afMarginPrc = _parseValue(buffer, 21);
        afMarginQty = _parseValue(buffer, 21);
        afLeverage = _parseValue(buffer, 11);
        loNearPrc = _parseValue(buffer, 21);
        ikNearPrc = _parseValue(buffer, 21);
        afCrossLeverage  = _parseValue(buffer, 11);
        coinMktYn  = _parseValue(buffer, 1);
        afCode  = _parseValue(buffer, 16);
        mktBaseCode  = _parseValue(buffer, 16);
        mktBaseMmgb  = _parseValue(buffer, 1);
        mktBaseJqty  = _parseValue(buffer, 21);
        mktBasePamt  = _parseValue(buffer, 21);
        avTot        = _parseValue(buffer, 21);
        triggerType   = _parseValue(buffer, 1);
        afMaintenanceMarginRt  = _parseValue(buffer, 11);
        afInitialMarginRt  = _parseValue(buffer, 11);
        afriskHandoQty  = _parseValue(buffer, 11);
        afMarketGb = _parseValue(buffer, 1);
        afInsuranceStatus = _parseValue(buffer, 1);
        afMdAbleQty = _parseValue(buffer, 21);
        afPlSonik = _parseValue(buffer, 21);
        afMsms   = _parseValue(buffer, 21);
        afMsma   = _parseValue(buffer, 21);
        afMdms   = _parseValue(buffer, 21);
        afMdma   = _parseValue(buffer, 21);
        marginPrice = _parseValue(buffer, 21);
        afNetJqty = _parseValue(buffer, 21);
        afNumOrderStls = _parseValue(buffer, 2);
        plSonik = _parseValue(buffer, 16);
        susuAek = _parseValue(buffer, 16);
        leftOrdQty = _parseValue(buffer, 16);
        ordQty = _parseValue(buffer, 16);
        partnerLpYn = _parseValue(buffer, 1);

        //fieldPrint();
    }

    void fieldPrint()
    {
        print('-------------------------------------- ');
        print('ordNo    : $ordNo');
        print('orgOrdNo : $orgOrdNo');
        print('code     : $code');
        print('-------------------------------------- ');
    }

}

class GlobalAdmMsg
{
    late String type;
    late String dateTime;
    late String source;
    late String dataKey;
    late String data;


    int  offSet = 0;

    String  _parseValue(String buffer, int valueSz)
    {
        int _offSet = offSet;
        offSet += valueSz;
        return buffer.substring(_offSet, _offSet + valueSz);
    }

    void parseData(String buffer) {
        offSet = 0;

        type  = _parseValue(buffer, 1);
        dateTime = _parseValue(buffer, 16);
        source = _parseValue(buffer, 24);
        dataKey  = _parseValue(buffer, 64);
        data  = _parseValue(buffer, 200);

        fieldPrint();
    }

    void fieldPrint()
    {
        print('-------------------------------------- ');
        print('type     : $type');
        print('datetime : $dateTime');
        print('source     : $source');
        print('dataKey    : $dataKey');
        print('data       : $data');
        print('-------------------------------------- ');
    }
}

class UsrSvcRtsCheg
{
    late String type;
    late String count;
    late String code;
    late String jggb;
    late String cgub; // 1;매도, 2;매수

    late String time; // 체결시간
    late String curr; // 체결가
    late String diff; // 전일대비
    late String gise; // 직전대비
    late String giho; // 전일대비 2;상승, 3;보합, 5;하락
    late String rate; // 전일대비율(giho)
    late String siga;
    late String koga;
    late String jega;
    late String cvol; // 체결수량
    late String gvol; // 누적체결수량
    late String gamt; // 누적금액
    late String slby; // 체결구분: 매매구분: 2:매수, 1:매도
    late String fillrt;
    late String dtwork;
    late String utctime;
    late String jgga; // 전일종가

    late String h24koga;
    late String h24jega;
    late String h24gvol;
    late String h24gamt;
    late String h24diff;
    late String h24rate;

    int  offSet = 0;

    String  _parseValue(String buffer, int valueSz)
    {
        int _offSet = offSet;
        offSet += valueSz;
        return buffer.substring(_offSet, _offSet + valueSz);
    }

    parseData(String buffer) {
        offSet = 0;

        type  = _parseValue(buffer, 2);
        count  = _parseValue(buffer, 2);
        code  = _parseValue(buffer, 15);
        jggb = _parseValue(buffer, 1);
        cgub = _parseValue(buffer, 1);
        giho = _parseValue(buffer, 1);
        gise  = _parseValue(buffer, 1);
        time = _parseValue(buffer, 6);
        curr = _parseValue(buffer, 20);
        diff = _parseValue(buffer, 20);
        rate = _parseValue(buffer, 7);

        koga = _parseValue(buffer, 20);
        jega = _parseValue(buffer, 20);
        siga = _parseValue(buffer, 20);
        h24koga = _parseValue(buffer, 20);
        h24jega = _parseValue(buffer, 20);
        cvol = _parseValue(buffer, 20);

        gvol = _parseValue(buffer, 22);
        gamt = _parseValue(buffer, 22);
        h24gvol = _parseValue(buffer, 22);
        h24gamt = _parseValue(buffer, 22);

        h24diff = _parseValue(buffer, 20);
        dtwork = _parseValue(buffer, 8);

        fillrt = _parseValue(buffer, 8);
        utctime = _parseValue(buffer, 12);
        slby = _parseValue(buffer, 1);
        h24rate = _parseValue(buffer, 7);
        jgga = _parseValue(buffer, 20);

        //fieldPrint();
    }

    void fieldPrint()
    {
        print('-------------------------------------- ');
        print('type     : $code');
        print('datetime : $time');
        print('cvol     : $cvol');
        print('gvol     : $gvol');
        print('-------------------------------------- ');
    }
}