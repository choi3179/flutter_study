import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc77623
{
  // common var
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 77623;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvc77623();

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc77623({String gb = '1', String userId = '', String vAccn = '', String bcCode = '', String code = '', String jsonYn = 'Y', String othNioc = '', String phone = '', String certifyNo = '', String destinationTag = '', String filler = ''})
  {
    nArray ++;

    _setRangeValue(gb, 2);
    _setRangeValue(userId, 61);
    _setRangeValue(bcCode, 16);
    _setRangeValue(othNioc, 121);
    _setRangeValue(jsonYn, 2);
    _setRangeValue(filler, 7);
    _setRangeValue(phone, 16);
    _setRangeValue(certifyNo, 11);
    _setRangeValue(destinationTag, 101);
    _setRangeValue(filler, 3);
    _setRangeValue(vAccn, 17);
    _setRangeValue(code, 16);
    _setRangeValue(filler, 132);

  }

  Int8List requestData()
  {
    return request;
  }
}
