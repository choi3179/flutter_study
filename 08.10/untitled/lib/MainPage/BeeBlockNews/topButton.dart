import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget topButtonWidget(double horizon,String item, Color color){
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