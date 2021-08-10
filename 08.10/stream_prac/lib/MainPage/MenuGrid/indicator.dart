import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class oneIndicator extends StatelessWidget {
  final int length;
  final int current;

  oneIndicator(this.length, this.current);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 20.0.w * length.toDouble(),
        height: 10,
        child: ListView.builder(
          physics: NeverScrollableScrollPhysics(),
          itemCount: length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int index) {
            if (index == current) {
              return Padding(
                child: Icon(
                  Icons.circle,
                  size: 10.0.w,
                ),
                padding: EdgeInsets.only(left: 5.w, right: 5.w),
              );
            } else {
              return Padding(
                  child: Icon(Icons.circle_outlined,
                      size: 10.0.h, color: Colors.grey),
                  padding: EdgeInsets.only(left: 5.w, right: 5.w));
            }
          },
          //Text('$_current')
        ));
  }


}
