import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc17227
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 17227;
  Int8List request = Int8List(208);

  // 생성자
  UsrSvc17227()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc17227({String gb = 'J', String vAccn = '', String meme = '0', String dtFr = '', String dtTo = '', String code = '', String slby = '', String nextKey = '', String jsonYn = 'Y', String listCount = '18', String pageNumber = '0', String currency = 'KRW', String currencyRt = '', String filler = ''})
  {
    nArray ++;

    _setRangeValue(gb, 2);
    _setRangeValue(vAccn, 17);
    _setRangeValue(meme, 2);
    _setRangeValue(dtFr, 9);
    _setRangeValue(dtTo, 9);
    _setRangeValue(code, 16);
    _setRangeValue(slby, 2);
    _setRangeValue(nextKey, 51);
    _setRangeValue(currency, 4);
    _setRangeValue(currencyRt, 11);
    _setRangeValue(filler, 2);
    _setRangeValue(listCount, 5);
    _setRangeValue(pageNumber, 6);
    _setRangeValue(filler, 72);
  }

  Int8List requestData()
  {
    return request;
  }
}
