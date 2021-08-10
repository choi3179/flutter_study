import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc106122
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 106122;
  Int8List request = Int8List(101);

  // 생성자
  UsrSvc106122();

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc106122({String gb = '1', String coinCurrency = 'KRW', String marketGb = '', String currency = 'KRW', String currencyRt = '', String filler = ''})
  {
    nArray ++;

    _setRangeValue(gb, 1);
    _setRangeValue(currency, 4);
    _setRangeValue(currencyRt, 11);
    _setRangeValue(marketGb, 2);
    _setRangeValue(coinCurrency, 4);
    _setRangeValue(filler, 79);
  }

  Int8List requestData()
  {
    return request;
  }
}
