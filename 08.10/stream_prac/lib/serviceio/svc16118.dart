import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc16118
{
  // common var
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 16118;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvc16118()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc16118({String vAccn = '', String jikb = '', String aek = '', String bigo = '', String rqstApdt = '', String rqstAptm = '', String userId = '', String certifyNo = '', String currency = 'KRW', String bkcd = '', String bankName = '', String bankAccount = '', String accountName = '', String verifyType = '3', String tradePswdEncrypt = '', String filler = ''})
  {
    nArray ++;

    _setRangeValue(vAccn, 17);
    _setRangeValue(jikb, 2);
    _setRangeValue(aek, 23);
    _setRangeValue(bigo, 101);
    _setRangeValue(rqstApdt, 9);
    _setRangeValue(rqstAptm, 9);
    _setRangeValue(filler, 17);
    _setRangeValue(filler, 9);
    _setRangeValue(userId, 61);
    _setRangeValue(certifyNo, 7);
    _setRangeValue(bankName, 41);
    _setRangeValue(bankAccount, 21);
    _setRangeValue(currency, 4);
    _setRangeValue(bkcd, 4);
    _setRangeValue(verifyType, 2);
    _setRangeValue(tradePswdEncrypt, 65);
    _setRangeValue(accountName, 41);
    _setRangeValue(filler, 179);
  }

  Int8List requestData()
  {
     return request.sublist(0, offSet);
  }
}
