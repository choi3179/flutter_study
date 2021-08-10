import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc77625
{
  // common var
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 77625;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvc77625()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc77625({String gb = '1', String userId = '', String otpYn = 'Y', String otpKey = '', String otpCode = '', String payLevl = '', String tradeEncryptPswd = '', String othEmail = '', String filler = ''})
  {
    nArray ++;

    _setRangeValue(gb, 2);
    _setRangeValue(userId, 61);
    _setRangeValue(otpYn, 2);
    _setRangeValue(otpKey, 101);
    _setRangeValue(othEmail, 61);
    _setRangeValue(otpCode, 11);
    _setRangeValue(payLevl, 2);
    _setRangeValue(tradeEncryptPswd, 101);
    _setRangeValue(filler, 97);

  }

  Int8List requestData()
  {
    return request;
  }
}
