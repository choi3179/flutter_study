import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc17218
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 17218;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvc17218();

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc17218({String vAccn = '', String code = '', String jsonYn = 'Y', String currency = 'KRW', String currencyRt = '', String filler = ''})
  {
    nArray ++;
    offSet = 0;

    _setRangeValue(vAccn, 17);
    _setRangeValue(filler, 9);
    _setRangeValue(code, 16);
    _setRangeValue(currency, 4);
    _setRangeValue(currencyRt, 11);
    _setRangeValue(jsonYn, 2);

    _setRangeValue(filler, 83);
  }

  Int8List requestData()
  {
    return request.sublist(0, offSet);
  }
}
