import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';


class UsrSvc66122
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 66122;
  Int8List request = Int8List(66);

  // 생성자
  UsrSvc66122()
  {

  }

  // IO 만들기
  void makeUsrSvc66122({String hvGb = '8', String currency = 'KRW', double currencyRt = 1, String marketGb = 'X', String coinCurrency = 'KRW', String jsonYn = 'N'})
  {
    request.setRange(offSet, offSet +  1, hvGb.padRight(1).codeUnits);
    offSet += 1;
    request.setRange(offSet, offSet + 4, currency.padRight(4).codeUnits);
    offSet += 4;

    String strCurrencyRt = currencyRt.toString();
    request.setRange(offSet,  offSet + 11, strCurrencyRt.padLeft(11, '0').codeUnits);
    offSet += 11;
    request.setRange(offSet,  offSet + 2, marketGb.padRight(2).codeUnits);
    offSet += 2;
    request.setRange(offSet,  offSet + 4, coinCurrency.padRight(4).codeUnits);
    offSet += 4;
    request.setRange(offSet,  offSet + 1, jsonYn.padRight(1).codeUnits);
    offSet += 1;
    offSet += 43;
  }

  Int8List requestData()
  {
    return request.sublist(0, request.lengthInBytes);
  }
}


class UsrSvc66122_Back {
  int nArray = 0;
  BytesBuilder request = BytesBuilder();

  // 생성자
  UsrSvc66122()
  {
    request.add(Int8List(3));
  }

  // IO 만들기
  void makeUsrSvc66122(String isRegister, String dataKey, String attr)
  {
    request.add(isRegister.padRight(1).codeUnits);
    request.add(dataKey.padRight(16).codeUnits);
    request.add(attr.padRight(8).codeUnits);
    nArray ++;
    request.toBytes().fillRange(0, 3, nArray);

  }

//Int8List get request => request.toBytes();

}

