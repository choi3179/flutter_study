import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_prac/MainPage/widgetdata/eventMenu.dart';

import 'indicator.dart';

class eventMenuWidget extends StatefulWidget {
  @override
  _eventMenuState createState() => _eventMenuState();
}

class _eventMenuState extends State<eventMenuWidget> {
  CarouselController controller = CarouselController();
  int _current = 0;

  @override
  void initState() {
    super.initState();
    controller = CarouselController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //SizedBox(height: 7,),
          Container(
              width: MediaQuery.of(context).size.width,
              //width: 328.w,
              //height: 120.h,
              child: CarouselSlider.builder(
                itemCount: eventMenu.length,
                options: CarouselOptions(
                  height: 120.0,
                  initialPage: 0,
                  scrollDirection: Axis.horizontal,
                  enableInfiniteScroll: false,
                  //aspectRatio: 16/9,
                  onPageChanged: (index, reason) {
                    setState(() {
                      _current = index;
                    });
                  },
                ),
                //carouselController: controller,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return InkWell(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.0.w),
                      width: 328.w,
                      height: 100,
                      /*child: Image.asset('${eventMenu[index]}',
                            width: 328,
                            height: 100,),*/
                      child: Image.asset('${eventMenu[index]}',width: 350.0.w,height: 100.0,),
                    ),
                    onTap: () {},
                  );
                },
              )
              //),
              ),
          oneIndicator(eventMenu.length,_current)
        ]);
  }
}
