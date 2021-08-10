import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class calcWidget extends StatefulWidget {
  final Map<String, Object> list;

  calcWidget(this.list);

  @override
  _calcState createState() => _calcState(list);
}

class _calcState extends State<calcWidget> {
  final Map<String, Object> list;

  double _price = 0;
  double _percentage = 0;
  bool _visibility=true;
  late Color color;
  late IconData icon;

  _calcState(this.list);

  //var won=NumberFormat.currency(locale: 'ko_KR',symbol: "",decimalDigits: 2);
  var won=NumberFormat('###,###,###,###.##',"en_US");

  @override
  Widget build(BuildContext context) {
    _price = double.parse('${list['price']}') - double.parse('${list['siga']}');
    _percentage = _price / double.parse('${list['siga']}') * 100;
    //if()
    if (_price > 0) {
      color = Color(0xffD8352C);
      icon = Icons.arrow_drop_up_sharp;
      _visibility=true;
    }else if(_price==0){
      color = Colors.black;
      _visibility=false;
      icon = Icons.remove;
      //icon=;
    }else {
      color = Color(0xff2376F1);
      icon = Icons.arrow_drop_down_sharp;
      _visibility=true;
      //price = -price;
    }
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 35.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text('${list['name']} ${list['code']}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0.sp,
                      ),),
                    Icon(Icons.arrow_drop_down,size: 24.0.w,)
                  ],
                ),
                TextButton(
                  onPressed: () {  },
                  child: Text('호가보기',
                    style: TextStyle(
                        color: Color(0xff737373)
                    ),),
                  style: OutlinedButton.styleFrom(
                      minimumSize: Size(98.0,30.0),
                      backgroundColor: Color(0xffF3F4F6)
                  ),
                ),
              ],
            ),
          ),   /// 코인명, 호가보기 버튼
          Text(
              '${won.format(list['price'])}',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0.sp,
                  color: color)
          ),        /// 가격
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(child: Icon(icon,color: color,size: 16.0.w,),visible: _visibility,),
              SizedBox(width: 2.w),
              Text('${won.format(_price)}',
                  style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 12.0.sp)),
              SizedBox(width: 2.w),
              Text('(${_percentage.toStringAsFixed(2)}%)',
                  //overflow: TextOverflow.fade,
                  textScaleFactor: 1.0,
                  style: TextStyle(
                      color: color,
                      //fontWeight: FontWeight.bold,
                      fontSize: 12.0.sp))
            ],
          )         /// 차액
        ]);
  }
}
