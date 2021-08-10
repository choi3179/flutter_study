
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stream_prac/OneCoinTrade/CoinName/Trade/TopToggleButton.dart';
import 'package:stream_prac/OneCoinTrade/CoinName/Trade/pricetextfield.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_prac/OneCoinTrade/maincoin.dart';

class JiJungGa extends StatefulWidget{

  @override
  _JiJungGaState createState() => _JiJungGaState();

}

class _JiJungGaState extends State<JiJungGa> {

  final List<bool> _isSelected = [false, false, false, false];

  final int initial = 8805863;
  //int _changed = 88000000;

  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;

    return Column(
      children: [
        SizedBox(height: 13.0,),
        BlocBuilder(
          bloc: null,
          builder: (BuildContext context, TextFieldState state) {
            return PriceTextField('가격 KRW', globalPrice!=0?globalPrice:initial);
          }
        ),   /// 가격 입력
        SizedBox(
          height: 12.0,
        ),
        PriceTextField('수량 BTC', 0),      /// 수량 입력
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
                onPressed: (index) {
                  setState(() {
                  });
                },

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
      ],
    );
  }
}

