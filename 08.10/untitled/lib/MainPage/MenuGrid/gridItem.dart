import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:untitled/MainPage/widgetdata/gridIcons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class gridItemWidget extends StatefulWidget{
  @override
  _gridItemState createState() =>_gridItemState();

}

class _gridItemState extends State<gridItemWidget> {

  //int num1=0;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      //padding: EdgeInsets.all(10.0),
      shrinkWrap: true,
      padding: EdgeInsets.only(top:16.0,bottom: 10.0,left: 10.0,right: 10.0),
      //padding: EdgeInsets.symmetric(horizontal: 10.0.w),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //maxCrossAxisExtent: 90.w,
        crossAxisCount: 4,
        crossAxisSpacing: 10.w,
        mainAxisSpacing: 0,
        //childAspectRatio:1
      ),
      itemCount: gridIcons.length,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          child: Badge(
            badgeContent: Text('3', style: TextStyle(
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
            badgeColor: Colors.red,
            showBadge: index != 11 ? true : false,
            //child: Image.asset('${gridIcons[index]![1]}',width: 91.w,height: 80.h,),
            child: SvgPicture.asset('${gridIcons[index]![1]}',),//,width: 91,height: 80,),
            position: BadgePosition.topEnd(top: 15, end: 10.w),
          ),
          onTap: () {
            if(index==0){
              Navigator.pushNamed(context,'/trade');
            }
          },
        );
      },
    );
  }
}

