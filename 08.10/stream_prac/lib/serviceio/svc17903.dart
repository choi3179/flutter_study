import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc17903
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 17903;
  Int8List request = Int8List(154);

  // 생성자
  UsrSvc17903();

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc17903({String gb = 'J', String vAccn = '', String code = '', String calcPrice = '', String filler = ''})
  {
    nArray ++;

    _setRangeValue(gb, 1);
    _setRangeValue(vAccn, 16);
    _setRangeValue(code, 15);
    _setRangeValue(calcPrice, 22);
    _setRangeValue(filler, 100);
  }

  Int8List requestData()
  {
    return request;
  }
}
