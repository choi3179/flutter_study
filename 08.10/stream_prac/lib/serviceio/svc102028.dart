import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc102028
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 102028;
  Int8List request = Int8List(122);

  // 생성자
  UsrSvc102028()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc102028({String code = '1', String date = '', String gigan = '0100', String nBun = '001', String buttonGb = '1', String modGb = '0', String nFlag = '0', String nKey = '', String nDataGubun = '0', String imgRgb = '0', String nowDate = '1', String currency = 'KRW', String currencyRt = '', String jsonYn = 'Y', String filler = ''})
  {
    nArray ++;

    _setRangeValue(code, 15);
    _setRangeValue(date, 8);
    _setRangeValue(gigan, 4);
    _setRangeValue(nBun, 3);
    _setRangeValue(buttonGb, 1);
    _setRangeValue(modGb, 1);
    _setRangeValue(nFlag, 1);
    _setRangeValue(nKey, 21);
    _setRangeValue(nDataGubun, 1);
    _setRangeValue(imgRgb, 1);
    _setRangeValue(nowDate, 1);
    _setRangeValue(currency, 4);
    _setRangeValue(currencyRt, 11);
    _setRangeValue(jsonYn, 2);
    _setRangeValue(filler, 48);
  }

  Int8List requestData()
  {
    return request;
  }
}
