import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc16119
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 16119;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvc16119()
  {

  }

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  void makeUsrSvc16119({String gb = '5', String userId = '', String vAccn = '', String jikb = '', String aek = '', String code = '', String bigo = '', String myNioc = '', String othNioc = '', String rqstApdt = '', String rqstAptm = '', String certifyNo = '',
    String sFee = '0', String txId = '', String destinationTag = '', String destinationTagYn = 'N', String currency = 'KRW', String bkcd = '', String bankName = '', String bankAccount = '', String accountName = '', String verifyType = '',
    String tradePswdEncrypt = '', String bcCode = '', String ieoCode = '', String ieoPrice = '', String ieoRound = '', String siteDesc = '', String filler = ''
  })
  {
    nArray ++;

    _setRangeValue(userId, 61);
    _setRangeValue(vAccn, 17);
    _setRangeValue(gb, 2);
    _setRangeValue(aek, 23);
    _setRangeValue(bigo, 31);
    _setRangeValue(code, 16);
    _setRangeValue(myNioc, 121);
    _setRangeValue(othNioc, 121);
    _setRangeValue(rqstApdt, 9);
    _setRangeValue(rqstAptm, 9);
    _setRangeValue(filler, 17);
    _setRangeValue(filler, 9);
    _setRangeValue(certifyNo, 7);
    _setRangeValue(sFee, 23);
    _setRangeValue(txId, 121);
    _setRangeValue(destinationTag, 101);
    _setRangeValue(siteDesc, 51);
    _setRangeValue(verifyType, 2);
    _setRangeValue(tradePswdEncrypt, 65);
    _setRangeValue(destinationTagYn, 2);
    _setRangeValue(bcCode, 16);
    _setRangeValue(ieoCode, 16);
    _setRangeValue(ieoPrice, 21);
    _setRangeValue(ieoRound, 2);
    _setRangeValue(filler, 45);
  }

  Int8List requestData()
  {
    return request;
  }
}
