import 'dart:typed_data';
import 'dart:convert';
import 'package:crypto/crypto.dart';


class UsrSvc17131
{
  // common var
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 17131;
  Int8List request = Int8List(128);
  //Int8List request = [] as Int8List;

  // 생성자
  UsrSvc17131();

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc17131({String vAccn = '', String code = '', String jsonYn = 'Y', String filler = ''})
  {
    _setRangeValue(vAccn, 16);
    _setRangeValue(filler, 6);
    _setRangeValue(jsonYn, 2);
    _setRangeValue(code, 15);

  }

  Int8List requestData()
  {
    return request;
  }
}
