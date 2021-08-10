import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

AppBar makeAppBar(BuildContext context){
  return AppBar(
    title: SvgPicture.asset('images/logo.svg',color: Colors.black,width: 110.0.w,height: 27.0,),
    leading : IconButton(
      icon:Icon(Icons.arrow_back_ios,size: 24.0.w,),
      padding: EdgeInsets.only(left: 16.0.w),
      onPressed: (){
        Navigator.pop(context);
      },
    ),
    shadowColor: Colors.transparent,
    centerTitle: true,
    actions: [
      IconButton(
        icon: Icon(Icons.more_horiz),
        onPressed: () {  },
        padding: EdgeInsets.only(right: 16.0.w),
      )
    ],
  );
}