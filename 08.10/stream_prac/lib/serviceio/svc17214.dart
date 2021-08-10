import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc17214
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 17214;
  Int8List request = Int8List(126);

  // 생성자
  UsrSvc17214()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc17214({String vAccn = '', String code = '', String jqtyYn = 'Y', String currency = 'KRW', String currencyRt = '', String assetYn = 'Y', String jsonYn = 'Y', String filler = ''})
  {
    nArray ++;

    _setRangeValue(vAccn, 17);
    _setRangeValue(filler, 9);
    _setRangeValue(code, 16);
    _setRangeValue(jqtyYn, 2);
    _setRangeValue(currency, 4);
    _setRangeValue(assetYn, 2);
    _setRangeValue(jsonYn, 2);
    _setRangeValue(filler, 74);
  }

  Int8List requestData()
  {
     return request;
  }
}
