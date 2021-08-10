import 'dart:typed_data';


class UsrSvc16111
{
  // common var 
  int nArray = 0;
  int offSet = 0;
  int svcCode   = 16111;
  Int8List request = Int8List(1024);

  // 생성자
  UsrSvc16111();

  void _setRangeValue(String value, int valueSz)
  {
    request.setRange(offSet, offSet + valueSz, value.padRight(valueSz).codeUnits);
    offSet += valueSz;
  }

  // IO 만들기
  /*
  구분 1:조회,
  2:입력 + 승인,
  3:정정,
  4:승인거부,
  5:전체조회(16112로 변경됨),
  6:가입ID중복체크,
  7:이름+전화번호중복체크
  8: 별칭중복체크
  9; 가입신청만
  A: 로그인된 한id의 계좌의 거래비번만 조회(id),
  B: 한id의 계좌의 거래비번만 조회(ID+name+hp)
  C;
  U: 잊은 회원id만 조회(name+hp)
  S: 출금계좌 등록(문자인증)
  s: 출금계좌 등록(거래비번&pswdencryp;거래비번으로 사용)
  D: 2차 최종탈퇴처리(0:정상, 1:탈퇴),
  d; 1차 탈퇴상태만 update(0;정상, 1;탈퇴) user_info->user_info_exit
  E: ID+이름+전화번호 체크
  N: Nickname Update
  n: 이름 update
  J; 생년월일 update
  H: 핸드폰 저장 (문자번호요청한거랑 같이)
  h: 핸드폰 저장 (거래비번&pswdencrypt;거래비번으로 사용)
  F: 직원여부 저장(Y/N)
  M; mentoo 등록(소개자)
  K; kyc 진행여부(kyb_gb)
  X; 기존회원 OPTION 거래 가입,
  e: event_time 초기화
  */
  void makeUsrSvc16111({String gb = '1', String userId = '', String userNm = '', String passWd = '', String handPh = '', String jsonYn = 'N', String bankName = '', String bankAccount = '', String accountName = '', String introducer = '', String otpYn = 'N', String prkbGb = '0', String postNo = '', String hAddress = '', String personCheckGb = '0', String infoGb = '0', String pswdEncrypt = '', String juno = '', String nick = '', String dlkb = '0', String otpKey = '', String nation = 'KR', String currency = 'KRW', String bkcd = '', String certifyNo = '', String staffYn = 'N', String kycGb = '0', String rqstPayLevlYn = 'N', String rqstPayLevl = '', String foreignerYn = 'N', String hpDesc = '', String filler = ' '})
  {
    nArray ++;

    _setRangeValue(gb, 1);
    _setRangeValue(userId, 60);
    _setRangeValue(userNm, 40);
    _setRangeValue(passWd, 8);
    _setRangeValue(handPh, 20);
    _setRangeValue(filler, 30);
    _setRangeValue(bankName, 40);
    _setRangeValue(bankAccount, 20);
    _setRangeValue(accountName, 40);
    _setRangeValue(introducer, 60);
    _setRangeValue(otpYn, 1);
    _setRangeValue(prkbGb, 1);
    _setRangeValue(postNo, 10);
    _setRangeValue(hAddress, 74);
    _setRangeValue(personCheckGb, 1);
    _setRangeValue(infoGb, 1);
    _setRangeValue(pswdEncrypt, 64);
    _setRangeValue(juno, 13);
    _setRangeValue(nick, 50);
    _setRangeValue(dlkb, 1);
    _setRangeValue(otpKey, 10);
    _setRangeValue(nation, 2);
    _setRangeValue(currency, 3);
    _setRangeValue(bkcd, 3);
    _setRangeValue(certifyNo, 6);
    _setRangeValue(staffYn, 1);
    _setRangeValue(kycGb, 1);
    _setRangeValue(rqstPayLevlYn, 1);
    _setRangeValue(rqstPayLevl, 1);
    _setRangeValue(foreignerYn, 1);
    _setRangeValue(hpDesc, 101);
    _setRangeValue(jsonYn, 1);
    _setRangeValue(filler, 50);

  }

  Int8List requestData()
  {
    return request;
  }
}
