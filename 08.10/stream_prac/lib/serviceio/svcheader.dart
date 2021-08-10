import 'dart:io';
import 'dart:convert';
import 'dart:typed_data';
import 'globalSGA.dart';


int headerCheckSum0x02(Int8List list)
{
  int checksum = 0;
  int checksumbunmo;

  if (gGlobalSGA.media == 'a') {
    checksumbunmo = 191;
  } else {
    checksumbunmo = 217;
  }

  for (int x = 0; x < list.length; x++) {
    checksum += list.elementAt(x);
  }

  return checksum % checksumbunmo;
}


class SvcHeader
{

  // input stream field..
  int _len  = 0 ;
  int _crypto = 0;
  int _compr = 0;
  int _conti   = 0 ;
  int _media = 0;
  int _uncomprLen = 0;
  int _svc   = 0 ;
  int _handle = 0;
  int _privateAddr = 0;
  String _usid = "";
  int _cryptLen = 0;
  int _seq = 0;
  int _ret = 0;
  String _nation = 'KR';
  String _errYn = 'N';
  String  _contentType = 'N';
  int _publicAddr = 0;
  String _retMsg = "";
  int _session = 0;
  int _sessionFlag = 0;
  String _filler2 = "";
  int _stx = 0x01;

  int offSet       = 0;

  // 입력 스트림용 헤더 bytebuffer
  late ByteBuffer gh;

  // 서버 요청용 스트림용 헤더 bytebuffer
  var  requestHeader = Int8List(300);

  _setIntValue({int value = 0, int valueSz = 1, String fieldName = ''})
  {
    if (valueSz <= 1) {
      requestHeader.buffer.asByteData(offSet).setInt8(0, value);
    } else if (valueSz == 4) {
      requestHeader.buffer.asByteData(offSet, valueSz).setInt32(0, value);
    }

    offSet += valueSz;
  }
  _setStrValue({String value = '', int valueSz = 1})
  {
    requestHeader.buffer.asInt8List(offSet, valueSz).setRange(0, value.length, value.codeUnits);
    offSet += valueSz;
  }

  Int8List setSvcHeader(Int8List? requestBody, int requestSvc, int requestSeq)
  {
    offSet       = 0;
    if (requestBody == null) {
      _setIntValue(value:    0, valueSz: 4);  // bodyLen
      _setIntValue(value: 0x02, valueSz: 1);  // crypto
      _setIntValue(value: 0x01, valueSz: 1);  // compress
      _setIntValue(value:    0, valueSz: 1);  // cont
      _setStrValue(value: gGlobalSGA.media, valueSz: 1); // media
      _setIntValue(value:    0, valueSz: 4);  // uncompressLen
      _setIntValue(value:    requestSvc, valueSz: 4);  // svc
      _setIntValue(value:    0, valueSz: 4);  // handle
      _setIntValue(value:    0, valueSz: 4);  // private_addr
      _setStrValue(value: gGlobalSGA.userId.trim(), valueSz: 60);  // userid
      //print('request.header.userid1: [' + gGlobalSGA.userId + ']');
      _setIntValue(value:    0, valueSz: 4);  // crpto_len
      _setIntValue(value:   requestSeq, valueSz: 4);  // seq
      _setIntValue(value:   0, valueSz: 4);  // ret
      _setStrValue(value:  gGlobalSGA.nation, valueSz: 2);  // nation
      _setStrValue(value:  'N', valueSz: 1);  // err_yn
      _setStrValue(value:  'N', valueSz: 1);  // content_type
      _setIntValue(value:    0, valueSz: 4);  // public_addr
      _setStrValue(value:    ' ', valueSz: 100);  // ret_msg
      _setIntValue(value:    0, valueSz: 4);  // session
      _setIntValue(value:    0, valueSz: 1);  // session_flag
      _setStrValue(value:    ' ', valueSz: 90);  // filler
      _setStrValue(value:    ' ', valueSz: 1);  // stx

    } else {

      _setIntValue(value:  requestBody.lengthInBytes, valueSz: 4);  // bodyLen
      _setIntValue(value: 0x02, valueSz: 1);  // crypto
      _setIntValue(value: 0x01, valueSz: 1);  // compress
      _setIntValue(value:    0, valueSz: 1);  // cont
      _setStrValue(value: gGlobalSGA.media, valueSz: 1); // media
      _setIntValue(value:  requestBody.lengthInBytes, valueSz: 4);  // uncompressLen
      _setIntValue(value:    requestSvc, valueSz: 4);  // svc
      _setIntValue(value:    0, valueSz: 4);  // handle
      _setIntValue(value:    0, valueSz: 4);  // private_addr
      _setStrValue(value: gGlobalSGA.userId.trim(), valueSz: 60);  // userid
     // print('request.header.userid2: [' + gGlobalSGA.userId.trim() + ']');
      _setIntValue(value:    headerCheckSum0x02(requestBody), valueSz: 4);  // crpto_len
      _setIntValue(value:   requestSeq, valueSz: 4);  // seq
      _setIntValue(value:   0, valueSz: 4);  // ret
      _setStrValue(value:  gGlobalSGA.nation, valueSz: 2);  // nation
      _setStrValue(value:  'N', valueSz: 1);  // err_yn
      _setStrValue(value:  'N', valueSz: 1);  // content_type
      _setIntValue(value:    0, valueSz: 4);  // public_addr
      _setStrValue(value:    ' ', valueSz: 100);  // ret_msg
      _setIntValue(value:    0, valueSz: 4);  // session
      _setIntValue(value:    0, valueSz: 1);  // session_flag
      _setStrValue(value:    ' ', valueSz: 90);  // filler
      _setStrValue(value:    ' ', valueSz: 1);  // stx
    }

    return requestHeader;
  }

  int  _parseIntValue(ByteBuffer recvBuffer, int valueSz)
  {
    int _offSet = offSet;

    offSet += valueSz;
    if (valueSz == 1) {
      return recvBuffer.asByteData(_offSet, valueSz).getInt8(0);
    }

    return recvBuffer.asByteData(_offSet, valueSz).getInt32(0);
  }

  String _parseStrValue(ByteBuffer recvBuffer, int valueSz , String utfYn )
  {
    int _offSet = offSet;
    offSet += valueSz;

    if (utfYn == 'N') {
      return String.fromCharCodes(recvBuffer.asUint8List(_offSet, valueSz));
    }

    return utf8.decode(recvBuffer.asUint8List(_offSet, valueSz).toList());

  }

  // 입력헤더 assgin
  void parseData(ByteBuffer recvBuffer)
  {
    gh  = recvBuffer;

    offSet = 0;

    _len = _parseIntValue(recvBuffer, 4);
    _crypto = _parseIntValue(recvBuffer, 1);
    _compr = _parseIntValue(recvBuffer, 1);
    _conti = _parseIntValue(recvBuffer, 1);
    _media = _parseIntValue(recvBuffer, 1);
    _uncomprLen   = _parseIntValue(recvBuffer, 4);
    _svc   = _parseIntValue(recvBuffer, 4);
    _handle   = _parseIntValue(recvBuffer, 4);
    _privateAddr   = _parseIntValue(recvBuffer, 4);
    _usid  = _parseStrValue(recvBuffer, 60, 'N');
    _cryptLen   = _parseIntValue(recvBuffer, 4);
    _seq   = _parseIntValue(recvBuffer, 4);
    _ret   = _parseIntValue(recvBuffer, 4);
    _nation = _parseStrValue(recvBuffer, 2, 'N');
    _errYn = _parseStrValue(recvBuffer, 1, 'N');
    _contentType = _parseStrValue(recvBuffer, 1, 'N');
    _publicAddr = _parseIntValue(recvBuffer, 4);
    // 한글 변환 및 에러 메세지
    // _retMsg = utf8.decode(recvBuffer.asInt8List(offSetRetMsg, 100).toList());
    //_retMsg = utf8.decode(recvBuffer.asUint8List(offSetRetMsg, 100).toList());
    _retMsg = _parseStrValue(recvBuffer, 100, 'Y');
    _session = _parseIntValue(recvBuffer, 4);
    _sessionFlag = _parseIntValue(recvBuffer, 1);
    _filler2 =  _parseStrValue(recvBuffer, 90, 'N');
    _stx = _parseIntValue(recvBuffer, 1);

  }

  // getter
  int  get len    => _len;
  int  get crypto => _crypto;
  int  get compr  => _compr;
  int  get unComprLen => _uncomprLen;
  int  get conti  => _conti;
  int  get media  => _media;
  int  get svc    => _svc;
  int  get seq    => _seq;
  String get errYn => _errYn;
  String get contentType => _contentType;
  String get usid => _usid;

  // recv.헤더 사이즈
  int  get ghSize => (300);

  // recv.입력 스트림 크기
  int  get streamSize => ghSize;

  // output.setter

  /////////////

  void fieldPrint()
  {
    print('-------------------------------------- ');
    print('header.len/svc/unComprLen/crypto/compr/content_type/media> ' + _len.toString() + ',' + _svc.toString() + ',' + unComprLen.toString()
        + ',' + _crypto.toString() + ',' + _compr.toString() + ',' + _contentType
        + ',' + String.fromCharCode(_media));
    // print('header.crypto/compr/content_type> ' + _crypto.toString() + ',' + _compr.toString() + ',' + _contentType);
    print('header.usid                     > [' + _usid + ']');
    print('header.seq/ret/err_yn/ret_msg   > ' + _seq.toString() + ','+ _ret.toString() + ',' + _errYn + ',' + _retMsg);
  }

  void stringPrint()
  {
    print('header.string> [' + String.fromCharCodes(gh.asUint8List(0, 300)) + ']');
  }

// hci.buffer.asInt8List(offSet, 60).setRange(0, _usid.length, _usid.codeUnits);



}

