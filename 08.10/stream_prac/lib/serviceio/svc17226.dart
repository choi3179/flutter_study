import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc17226
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 17226;
  Int8List request = Int8List(208);

  // 생성자
  UsrSvc17226()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc17226({String gb = 'J', String vAccn = '', String marketGb = '', String dtFr = '', String dtTo = '', String code = '', String slby = '', String nextKey = '', String listCount = '18', String pageNumber = '0', String jsonYn = 'Y', String filler = ''})
  {
    nArray ++;

    _setRangeValue(gb, 2);
    _setRangeValue(vAccn, 17);
    _setRangeValue(dtFr, 9);
    _setRangeValue(dtTo, 9);
    _setRangeValue(code, 16);
    _setRangeValue(slby, 2);
    _setRangeValue(nextKey, 31);
    _setRangeValue(filler, 2);
    _setRangeValue(marketGb, 2);
    _setRangeValue(listCount, 5);
    _setRangeValue(pageNumber, 6);
    _setRangeValue(filler, 96);
  }

  Int8List requestData()
  {
    return request;
  }
}
