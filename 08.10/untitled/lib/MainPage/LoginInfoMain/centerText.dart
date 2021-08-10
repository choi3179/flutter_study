import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class centerTextWidget extends StatefulWidget {


  centerTextWidget();

  @override
  _centerTextState createState() => _centerTextState();
}

class _centerTextState extends State<centerTextWidget> {

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            '비블록 거래소 ISMS 인증 예비심사 통과',
            style: TextStyle(fontSize: 14.0.sp),
          ),
          /*Chip(
              label: Text(
                'N',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.red,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0),
              ),
              padding: EdgeInsets.all(2.0))*/ /// Chip
        ],
      ),
      width: MediaQuery.of(context).size.width - 10,
      height: 34.0.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.0.r),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(4.0, 4.0),
              blurRadius: 15.0,
              spreadRadius: 1.0,
            )
          ]),
    );
  }
}
