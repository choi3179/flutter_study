import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvcOrder
{
  // common var 
  int nArray    = 0;
  int offSet    = 0;
  int svcCode   = -1;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvcOrder()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvcOrder({String userId = '', String vAccn = '', String code = '', String slby = '2', String ordType = '2', String ordQty = '0', String ordPrice = '0', String ipAddr = '', String currency = 'KRW', String itemSect = '00', String postOnly = '', String hiddenYn = '', String fillOption = '1', String reduceOnlyYn = 'N', String stlsYn = 'N', String loNearPrice = '0', String ikNearPrice = '0', String liqudationYn = 'N', String lpYn = 'N', String userArea = '', String filler = ''})
  {
    nArray ++;

    if (slby == '1') { // 매도
      svcCode = 41066;
    } else if (slby == '2') {           // 매수
      svcCode = 41065;
    } else {
      svcCode = -1;
    }

    _setRangeValue(userId, 64);
    _setRangeValue(ipAddr, 15);
    _setRangeValue(filler, 1);
    _setRangeValue(filler, 5);
    _setRangeValue(filler, 80);
    _setRangeValue(itemSect, 2);
    _setRangeValue(userArea, 20);
    _setRangeValue(filler, 50);

    _setRangeValue(vAccn, 12);
    _setRangeValue(filler, 9);
    _setRangeValue(code, 16);

    _setRangeValue(slby, 2);
    _setRangeValue(ordType, 2);
    _setRangeValue((double.parse(ordQty) * 100000000).toString(), 20);
    _setRangeValue(filler, 1);
    _setRangeValue((double.parse(ordPrice) * 100000000).toString(), 20);
    _setRangeValue(filler, 1);
    _setRangeValue(filler, 2);
    _setRangeValue(filler, 2);
    _setRangeValue(filler, 2);
    _setRangeValue(filler, 7);
    _setRangeValue(filler, 9);
    _setRangeValue(filler, 7);
    _setRangeValue(filler, 2);
    _setRangeValue(filler, 6);
    _setRangeValue(filler, 11);
    _setRangeValue(filler, 21);
    _setRangeValue(currency, 4);
    _setRangeValue(postOnly, 1);
    _setRangeValue(hiddenYn, 1);
    _setRangeValue(fillOption, 1);
    _setRangeValue(reduceOnlyYn, 1);
    _setRangeValue(stlsYn, 1);
    _setRangeValue(loNearPrice, 21);
    _setRangeValue(ikNearPrice, 21);
    _setRangeValue(filler, 1);
    _setRangeValue(liqudationYn, 1);
    _setRangeValue(lpYn, 1);
    _setRangeValue(filler, 25);

  }

  Int8List requestData()
  {
    return request.sublist(0, offSet);
  }
}

class UsrSvcOrderCancel
{
  // common var
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 41067;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvcOrderCancel()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvcOrderCancel({String userId = '', String vAccn = '', String code = '', String slby = '2', String guBun = '', String ordType = '2', String ordQty = '0', String ordPrice = '0', String orgPrefixOrdNo = '', String orgOrdNo = '', String ipAddr = '', String currency = 'KRW', String itemSect = '00', String postOnly = '', String hiddenYn = '', String fillOption = '1', String reduceOnlyYn = 'N', String stlsYn = 'N', String loNearPrice = '0', String ikNearPrice = '0', String liqudationYn = 'N', String lpYn = 'N', String userArea = '', String filler = ''})
  {
    nArray ++;

    _setRangeValue(userId, 64);
    _setRangeValue(ipAddr, 15);
    _setRangeValue(filler, 1);
    _setRangeValue(filler, 5);
    _setRangeValue(filler, 80);
    _setRangeValue(itemSect, 2);
    _setRangeValue(userArea, 20);
    _setRangeValue(filler, 50);
    _setRangeValue(vAccn, 12);
    _setRangeValue(filler, 9);
    _setRangeValue(orgOrdNo, 6);
    _setRangeValue(filler, 1);
    _setRangeValue(guBun, 1);
    _setRangeValue(filler, 1);
    _setRangeValue(code, 16);
    _setRangeValue(slby, 2);
    _setRangeValue(ordQty, 20);
    _setRangeValue(filler, 1);
    _setRangeValue(ordPrice, 20);
    _setRangeValue(filler, 1);
    _setRangeValue(filler, 2);
    _setRangeValue(filler, 2);
    _setRangeValue(filler, 2);
    _setRangeValue(filler, 7);
    _setRangeValue(filler, 9);
    _setRangeValue(filler, 7);
    _setRangeValue(filler, 7);
    _setRangeValue(filler, 2);
    _setRangeValue(filler, 5);
    _setRangeValue(orgPrefixOrdNo, 12);
    _setRangeValue(filler, 1);
    _setRangeValue(filler, 21);
    _setRangeValue(currency, 4);
    _setRangeValue(postOnly, 1);
    _setRangeValue(hiddenYn, 1);
    _setRangeValue(fillOption, 1);
    _setRangeValue(reduceOnlyYn, 1);
    _setRangeValue(liqudationYn, 1);
    _setRangeValue(filler, 70);

  }

  Int8List requestData()
  {
    return request.sublist(0, offSet);
  }
}