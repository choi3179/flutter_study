import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc18103
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 18103;
  Int8List request = Int8List(129);

  // 생성자
  UsrSvc18103()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc18103({String vAccn = '', String ordStat = 'A', String dtFr = '', String dtTo = '', String code = '',  String nextKey = '', String jsonYn = 'Y', String filler = ''})
  {
    nArray ++;

    _setRangeValue(vAccn, 17);
    _setRangeValue(ordStat, 2);
    _setRangeValue(dtFr, 9);
    _setRangeValue(dtTo, 9);
    _setRangeValue(nextKey, 41);
    _setRangeValue(code, 16);
    _setRangeValue(jsonYn, 2);
    _setRangeValue(filler, 33);
  }

  Int8List requestData()
  {
    return request;
  }
}
