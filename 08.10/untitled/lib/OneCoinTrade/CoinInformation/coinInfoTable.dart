import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CoinInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;

    return Container(
      height: 459,
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: 50,
            width: width - 32.w,
            alignment: Alignment.centerLeft,
            child: Text('코인정보',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0.sp)),
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.w, color: Color(0xffECEFF1)))),
          ),      /// 코인 정보 타이틀
          Container(
            height: 225,
            width: width - 32.w,
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 1.w, color: Color(0xffECEFF1)))),
            child: SvgPicture.asset('images/tmp_coinInfo.svg'),
          ),      /// 코인 정보 글
          RowInfo(width, '최초발행', '2009년 1월'),     /// 최초 발행
          RowInfo(width, '시가총액(~월~~일 기준)', '840조 1717억'),    /// 시가총액
          RowInfo(width, '총 발행한도', '2100만개'),     /// 총 평가금액
          RowInfo(width, '합의 프로토콜', 'POW'),       /// 합의 프로토콜
        ],
      ),
    );
  }

  Widget RowInfo(double width, String title, String info) {
    return Container(
      height: 46,
      width: width - 32.w,
      decoration: BoxDecoration(
          border:
              Border(bottom: BorderSide(width: 1.w, color: Color(0xffECEFF1)))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '$title',
            style: TextStyle(fontSize: 14.0.sp, color: Color(0xff737373)),
          ),
          Text(
            '$info',
            style: TextStyle(
                fontSize: 14.0.sp,
                color: Color(0xff737373)),
          )
        ],
      ),
    );
  }   /// 행 위젯
}
