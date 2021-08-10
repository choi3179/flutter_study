import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget topButtonWidget(double horizon,String item, Color color){
  /*return Center(
    child: Container(
      width: (width-32.w)/3,
      height: 34.0,
      alignment: Alignment.center,
      child: Text('$item',style: TextStyle(
          fontSize: 13.0.sp,
          color: color,
          fontWeight:fontWeight
      ),
        textAlign: TextAlign.center,
      ),
      decoration: BoxDecoration(
          //borderRadius: BorderRadius.only(topRight: Radius.circular(4.0),bottomRight: Radius.circular(4.0)),
          borderRadius: BorderRadius.all(Radius.circular(4.0)),
          border: Border.all(
              width: 1,
              color: color,
              style: BorderStyle.solid
          )
      ),
    ),
  );*/
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: horizon),
    child: Text('$item',style: TextStyle(
      fontSize: 13.0.sp,
      color: color,
    ),
      textAlign: TextAlign.center,
    ),
  );
}