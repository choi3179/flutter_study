import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc66131
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 66131;
  Int8List request = Int8List(100);

  // 생성자
  UsrSvc66131();

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc66131({String code = '',  String jsonYn = 'Y', String filler = ''})
  {
    nArray ++;

    _setRangeValue(jsonYn, 1);
    _setRangeValue(code, 16);
    _setRangeValue(filler, 33);
  }

  Int8List requestData()
  {
    return request;
  }
}
