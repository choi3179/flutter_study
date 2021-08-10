import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc18106
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 18106;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvc18106();
  
  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc18106({String vAccn = '', String ordStat = 'A', String dtFr = '', String dtTo = '', String code = '',  String nextKey = '', String slby = '', String vAccnYn = 'N', String userId = '', String itemSect = '', String jsonYn = 'Y', String filler = ''})
  {
    nArray ++;
    offSet = 0;

    _setRangeValue(vAccn, 17);
    _setRangeValue(ordStat, 2);
    _setRangeValue(dtFr, 9);
    _setRangeValue(dtTo, 9);
    _setRangeValue(nextKey, 41);
    _setRangeValue(code, 16);
    _setRangeValue(slby, 2);
    _setRangeValue(vAccnYn, 1);
    _setRangeValue(userId, 61);
    _setRangeValue(itemSect, 3);
    _setRangeValue(filler, 51);
  }

  Int8List requestData()
  {
    return request.sublist(0, offSet);
  }
}
