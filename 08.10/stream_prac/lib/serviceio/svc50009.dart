import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc50009
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 50009;
  Int8List request = Int8List(512);

  // 생성자
  UsrSvc50009()
  {
    offSet = 3;
  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc50009({String type = 'S', String isRegister = 'Y', String dataKey = ' ', String attr = '00000001'})
  {
    nArray ++;

    _setRangeValue(type, 1);
    _setRangeValue(isRegister, 1);
    _setRangeValue(dataKey, 60);
    _setRangeValue(attr, 8);

    //request.setRange(0,  3, nArray.toString().codeUnits);
    String strArray = nArray.toString();
    request.setRange(0,  3, strArray.padLeft(3, '0').codeUnits);

  }

  Int8List requestData()
  {
    return request.sublist(0, offSet);
  }
}

