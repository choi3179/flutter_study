
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget RowStock(String text){
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('종목',
        style: TextStyle(
            fontSize: 12.0.sp,
            color: Color(0xff737373)
        ),),
      Text('$text',
        style: TextStyle(
            fontSize: 12.0.sp,
            color: Colors.black,
            fontWeight: FontWeight.bold
        ),),
    ],
  );
}

Widget RowItemPrice(int price){

  var won = NumberFormat('###,###,###,###', 'en_US');

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('주문가격',
        style: TextStyle(
            fontSize: 12.0.sp,
            color: Color(0xff737373)
        ),),
      Text('${won.format(price)}',
        style: TextStyle(
          fontSize: 12.0.sp,
          color: Colors.black,
        ),),
    ],
  );
}

Widget RowItemAmount(double amount){
  var won = NumberFormat('###,###,###,###.#####', 'en_US');
  double temp=double.parse(won.format(amount));

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('주문수량',
        style: TextStyle(
            fontSize: 12.0.sp,
            color: Color(0xff737373)
        ),),
      Text('${temp.toStringAsFixed(4)}',
        style: TextStyle(
          fontSize: 12.0.sp,
          color: Colors.black,
        ),),
    ],
  );
}

Widget RowItemUncleared(double uncleared){

  var won = NumberFormat('###,###,###,###.#####', 'en_US');
  double temp=double.parse(won.format(uncleared));

  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text('미체결',
        style: TextStyle(
            fontSize: 12.0.sp,
            color: Color(0xff737373)
        ),),
      Text('${temp.toStringAsFixed(4)}',
        style: TextStyle(
          fontSize: 12.0.sp,
          color: Colors.black,
        ),),
    ],
  );
}