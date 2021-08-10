import 'dart:typed_data';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'svcheader.dart';


class UsrSvc16311
{
  // common var
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 16311;
  Int8List request = Int8List(1200);

  // 생성자
  UsrSvc16311();

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc16311({String gb = 'J', String userId = '', String category = '', String key = '', String value = '', String value2 = 'Y', String filler = ''})
  {
    offSet = 0;

    _setRangeValue(gb, 1);
    _setRangeValue(userId, 61);
    _setRangeValue(category, 11);
    _setRangeValue(key, 21);
    _setRangeValue(value, 11);
    _setRangeValue(value2, 1001);

  }

  Int8List requestData()
  {
    return request.sublist(0, offSet);
  }
}
