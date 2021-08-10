import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc77622
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 77622;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvc77622()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc77622({String gb = 'J', String userId = '', String code = '', String vAccn = '', String filler = ''})
  {
    nArray ++;

    _setRangeValue(gb, 2);
    _setRangeValue(userId, 61);
    _setRangeValue(code, 16);
    _setRangeValue(vAccn, 17);
    _setRangeValue(filler, 100);

  }

  Int8List requestData()
  {
    return request;
  }
}
