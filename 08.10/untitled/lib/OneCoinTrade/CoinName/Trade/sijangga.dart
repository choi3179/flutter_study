
import 'package:flutter/material.dart';
import 'package:untitled/OneCoinTrade/CoinName/Trade/TopToggleButton.dart';
import 'package:untitled/OneCoinTrade/CoinName/Trade/pricetextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SiJangGa extends StatefulWidget{

  @override
  _SiJangGaState createState() =>_SiJangGaState();

}

class _SiJangGaState extends State<SiJangGa>{

  final List<bool> _isSelected = [false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
          width: 200.w,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '가격',
                style: TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.bold),
              ),
              Text(
                '시장가',
                style: TextStyle(fontSize: 12.0.sp, fontWeight: FontWeight.bold),
              ),
              //_tradeIdx==0||_tradeIdx==1?PriceDecisionWidget(_tradeIdx,_tapIdx)
            ],
          ),
        ),
        SizedBox(height: 14.0,),
        PriceTextField('수량 BTC',0),   /// 가격 입력
        SizedBox(
          height: 12.0,
        ),
        Container(
          width: 200.w,
          height: 30.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ToggleButtons(
                color: Color(0xffE0E3E5),
                selectedColor: Colors.black,
                selectedBorderColor: Colors.black,
                fillColor: Colors.white,
                borderRadius: BorderRadius.circular(4.0.r),
                constraints: BoxConstraints(minHeight: 34.0, maxWidth: 200.w),

                isSelected: _isSelected,
                onPressed: (index) {},

                children: [
                  topButtonWidget(0.0, '10%',
                      _isSelected[0] ? Colors.black : Color(0xff737373)),
                  topButtonWidget(0.0, '25%',
                      _isSelected[1] ? Colors.black : Color(0xff737373)),
                  topButtonWidget(0.0, '50%',
                      _isSelected[2] ? Colors.black : Color(0xff737373)),
                  topButtonWidget(0.0, '100%',
                      _isSelected[3] ? Colors.black : Color(0xff737373))
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        PriceTextField('총액 BTC',0)  /// 수량 입력
      ],
    );
  }
}