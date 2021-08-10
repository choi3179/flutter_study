import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc102032
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 102032;
  Int8List request = Int8List(80);

  // 생성자
  UsrSvc102032()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc102032({String code = '', String currency = 'KRW', String currencyRt = '', String filler = ''})
  {
    nArray ++;

    _setRangeValue(code, 15);
    _setRangeValue(currency, 4);
    _setRangeValue(currencyRt, 11);
    _setRangeValue(filler, 50);
  }

  Int8List requestData()
  {
    return request;
  }
}
