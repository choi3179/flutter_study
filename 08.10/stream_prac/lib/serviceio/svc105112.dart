import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc105112
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 105112;
  Int8List request = Int8List(80);

  // 생성자
  UsrSvc105112()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc105112({String gb = '1', String code = '', String date = '', String currency = 'KRW', String currencyRt = '', String jsonYn = 'Y', String filler = ''})
  {
    nArray ++;

    _setRangeValue(gb, 1);
    _setRangeValue(code, 15);
    _setRangeValue(date, 8);
    _setRangeValue(currency, 4);
    _setRangeValue(currencyRt, 11);
    _setRangeValue(jsonYn, 1);
    _setRangeValue(filler, 35);
  }

  Int8List requestData()
  {
    return request;
  }
}
