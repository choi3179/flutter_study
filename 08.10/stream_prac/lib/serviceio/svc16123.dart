import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc16123
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 16123;
  Int8List request = Int8List(300);

  // 생성자
  UsrSvc16123();

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc16123({String vAccn = '', String ipChkb = '', String jikb = '', String krwYn = 'Y', String jsonYn = 'Y', String code = '', String dtFr = '', String dtTo = '', String filler = ''})
  {
    nArray ++;

    _setRangeValue(vAccn, 17);
    _setRangeValue(ipChkb, 2);
    _setRangeValue(jikb, 2);
    _setRangeValue(krwYn, 2);
    _setRangeValue(jsonYn, 2);
    _setRangeValue(filler, 1);
    _setRangeValue(code, 16);
    _setRangeValue(dtFr, 9);
    _setRangeValue(dtTo, 9);
  }

  Int8List requestData()
  {
    return request;
  }
}
