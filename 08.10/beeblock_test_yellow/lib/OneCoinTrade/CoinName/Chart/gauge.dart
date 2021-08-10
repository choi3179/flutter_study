
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PriceGauge extends StatefulWidget{
  @override
  _PriceGaugeState createState() => _PriceGaugeState();

}

class _PriceGaugeState extends State<PriceGauge>{

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 79,
        padding: EdgeInsets.symmetric(horizontal: 16.0.w),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4,),
                  Text('저가(당일)',
                    style: TextStyle(
                        fontSize: 13.0.sp,
                        color: Color(0xff737373)
                    ),
                    maxLines: 1
                  ),
                  Text('35,935,000',
                    style: TextStyle(
                        fontSize: 14.0.sp,
                        color: Color(0xff2376F1)
                    ),
                    maxLines: 1
                  ),
                ],
              ),
              flex: 83,
            ),
            Expanded(
              child: SfLinearGauge(
                showTicks: false,
                showLabels: false,
                minimum: 35935000,
                maximum: 46900000,
                markerPointers: [
                  LinearWidgetPointer(
                    value: 40000000,
                    //animationType: LinearAnimationType.easeInCirc
                    enableAnimation: false,
                    position: LinearElementPosition.outside,
                    child: Container(
                      height: 30,
                      width: 40.w,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('현재가',
                            style: TextStyle(
                                fontSize: 12.0.sp,
                                color: Color(0xff737373)
                            ),),
                          //SizedBox(height: 1,),
                          SvgPicture.asset('images/Polygon 31.svg',width: 10.0,height: 10.0,color: Colors.black,)
                        ],
                      ),
                    ),
                    markerAlignment: LinearMarkerAlignment.center,
                  )
                ],
              ),
              flex: 210,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(height: 4,),
                  Text('고가(당일)',
                    style: TextStyle(
                        fontSize: 13.0.sp,
                        color: Color(0xff737373)
                    ),
                    maxLines: 1
                  ),
                  Text('46,900,000',
                    style: TextStyle(
                        fontSize: 14.0.sp,
                        color: Color(0xffD8352C)
                    ),
                    maxLines: 1
                  ),
                ],
              ),
              flex:83,
            ),
          ],
        )
    );
  }

}


