import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget topButtonWidget(double horizon,String item, Color color){
  return Container(
    width: 45.w,
    height: 30,
    alignment: Alignment.center,
    //padding: EdgeInsets.symmetric(horizontal: horizon),
    padding: EdgeInsets.all(horizon.w),
    child: Text('$item',style: TextStyle(
      fontSize: 13.0.sp,
      color: color,
    ),
      maxLines: 1,
      textAlign: TextAlign.center,
    ),
  );
}