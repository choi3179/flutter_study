import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_prac/Data/tradelist/tradeList.dart';
import 'package:stream_prac/OneCoinTrade/CoinName/Trade/TradelistItem.dart';

class UnclearedTradeWidget extends StatefulWidget {
  @override
  _UnclearedTradeState createState() => _UnclearedTradeState();
}

class _UnclearedTradeState extends State<UnclearedTradeWidget> {

  var _isChecked = List.filled(sampleTradeData.length, false);

  @override
  Widget build(BuildContext context) {
    //print(_isChecked);
    return Container(
      padding: EdgeInsets.all(10.0.w),
      width: 220.w,
      height: 607,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //padding: EdgeInsets.all(10.0),
            child: OutlinedButton(
              onPressed: () {},
              child: Text(
                '선택취소',
                style: TextStyle(color: Color(0xff737373)),
              ),
              style: OutlinedButton.styleFrom(
                  minimumSize: Size(200.0.w, 30.0),
                  side: BorderSide(color: Color(0xffBBBBBB))),
            ),
          ),
          Container(
            height: 517,
            child: ListView.separated(
                itemCount: sampleTradeData.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        _isChecked[index] = !_isChecked[index];
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Text(
                                  '${sampleTradeData[index]['type']}',
                                  style: TextStyle(
                                      fontSize: 13.0.sp,
                                      fontWeight: FontWeight.bold,
                                      color:
                                          sampleTradeData[index]['type'] == '매수'
                                              ? Color(0xffD8352C)
                                              : Color(0xff2376F1)),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white,
                                    //border: Border.all(color: Color(0xffBBBBBB),width: 1)
                                  ),
                                  child: _isChecked[index]
                                      ? Icon(
                                          Icons.check_circle,
                                          size: 24.0.w,
                                          color: Color(0xffFFBC00),
                                        )
                                      : Icon(
                                          Icons.radio_button_unchecked_outlined,
                                          size: 24.0.w,
                                          color: Colors.grey,
                                        ),
                                ),
                              ],
                            ),
                            Text(
                              '${sampleTradeData[index]['date']}',
                              style: TextStyle(
                                  fontSize: 11.0.sp, color: Color(0xff737373)),
                            ),
                          ],
                        ),

                        /// 매수 and checkBox row
                        SizedBox(
                          height: 9,
                        ),
                        RowStock('${sampleTradeData[index]['code']}'),

                        /// 종목 row
                        RowItemPrice(sampleTradeData[index]['price']),

                        /// 주문가격 row
                        RowItemAmount(sampleTradeData[index]['amount']),

                        /// 주문수량 row
                        RowItemUncleared(sampleTradeData[index]['uncleared'])

                        /// 미체결 row
                      ],
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) =>
                    Divider()),
          ),
        ],
      ),
    );
  }
}
