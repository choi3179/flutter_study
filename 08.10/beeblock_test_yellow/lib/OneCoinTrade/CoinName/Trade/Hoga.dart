
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HogaWidget extends StatefulWidget{
  @override
  _HogaWidgetState createState() => _HogaWidgetState();


}

class _HogaWidgetState extends State<HogaWidget>{
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 40,
      itemBuilder: (BuildContext context, int index) {
          return Container(
            width: 194.w,
            height: 26,
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  width: 0.5.w,
                  color: Colors.white
                ),
                bottom: BorderSide(
                    width: 0.5.w,
                    color: Colors.white
                ),
              )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 126.w,
                  color: index<=20?Color(0xff2376F1).withOpacity(0.08):Color(0xffD8352C).withOpacity(0.08),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: index<=20?Color(0xff2376F1).withOpacity(0.17):Color(0xffD8352C).withOpacity(0.17),
                        ),
                        flex: 26,
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.transparent,
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Text('46,379,000',
                              style: TextStyle(
                                color: Color(0xffD8352C),
                                fontSize: 12.0.sp
                              ),
                            ),
                          ),
                        ),
                        flex: 100,
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white,
                  width: 1.w,
                ),
                Container(
                  color: index<=20?Color(0xff2376F1).withOpacity(0.08):Color(0xffD8352C).withOpacity(0.08),
                  width: 67.w,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal: 4.0.w),
                    color: Colors.transparent,
                    child: Text('0.000100',style:
                      TextStyle(
                        fontSize: 10.0.sp,
                        color: Colors.black
                      ),),
                  ),
                )
              ],
            ),
          );
      },
    );
  }


}