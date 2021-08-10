import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc77624
{
  // common var
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 77624;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvc77624()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc77624({String gb = 'V', String userId = '', String code = '', String othNioc = '', String destinationTag = '', String filler = ''})
  {
    nArray ++;

    _setRangeValue(gb, 2);
    _setRangeValue(userId, 61);
    _setRangeValue(code, 16);
    _setRangeValue(othNioc, 121);
    _setRangeValue(destinationTag, 101);
    _setRangeValue(filler, 168);

  }

  Int8List requestData()
  {
    return request;
  }
}
