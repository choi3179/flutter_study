import 'dart:typed_data';
import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'svcheader.dart';


class UsrSvc20003
{

  // common var
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 20003;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvc20003();

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc20003({String usid = '', String pswd = '', String? encryptPswd, String jsonYn = 'Y', String tradePswdYn = 'N', String tradePswd = '', String firstSsoYn = 'Y', String filler = ''})
  {
    offSet = 0;

    String _encryptPswd = '';

    if (encryptPswd != null) {
      _encryptPswd = encryptPswd;
    } else {
      _encryptPswd = sha256.convert(utf8.encode(pswd)).toString();
    }
    _setRangeValue(usid, 60);
    _setRangeValue(_encryptPswd, 64);
    _setRangeValue(filler, 8);
    _setRangeValue(filler, 30);
    _setRangeValue(tradePswdYn, 2);
    _setRangeValue(tradePswd, 64);
    _setRangeValue(firstSsoYn, 2);
    _setRangeValue(filler, 151);
    _setRangeValue(jsonYn, 1);
    _setRangeValue(filler, 99);

  }

  Int8List requestData()
  {
    return request.sublist(0, offSet);
  }
}
