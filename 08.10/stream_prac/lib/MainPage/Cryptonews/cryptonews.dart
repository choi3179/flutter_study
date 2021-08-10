import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_prac/Data/news/cryptonews.dart';
import 'package:stream_prac/MainPage/Cryptonews/topButton.dart';
import 'package:stream_prac/MainPage/MenuGrid/indicator.dart';


class cryptoNewsWidget extends StatefulWidget {
  @override
  _cryptoNewsState createState() => _cryptoNewsState();
}

class _cryptoNewsState extends State<cryptoNewsWidget> {

  int _touchedIdx=0;
  int _itemIndex=0;
  final List<bool> _isSelected=[true,false,false];
  var temp;

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
      SizedBox(height: 8,),
      Container(
          width: width,
          height:50,
          color: Colors.white,
          padding: EdgeInsets.only(left: 16.0.w,right: 16.0.w, top: 10.0, bottom: 14.0),
          alignment: Alignment.centerLeft,
          child: Text(
            '크립토 뉴스',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
          )),   /// Header
      Container(
        padding: EdgeInsets.only(left: 16.0.w,right: 16.0.w,),
        width: width,
        height: 34,
        color: Colors.white,
        alignment: Alignment.center,
        /*child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InkWell(
                child: topButtonWidget(width,'전체',_touchedIdx==0?Colors.black:Color(0xff737373),_touchedIdx==0?FontWeight.bold:FontWeight.normal),
                onTap:(){
                  setState(() {
                    _touchedIdx=0;
                  });
                }
            ),
            InkWell(
                child: topButtonWidget(width,'이벤트',_touchedIdx==1?Colors.black:Color(0xff737373),_touchedIdx==1?FontWeight.bold:FontWeight.normal),
                onTap:(){
                  setState(() {
                    _touchedIdx=1;
                  });
                }
            ),
            InkWell(
                child: topButtonWidget(width,'상장종목',_touchedIdx==2?Colors.black:Color(0xff737373),_touchedIdx==2?FontWeight.bold:FontWeight.normal),
                onTap:(){
                  setState(() {
                    _touchedIdx=2;
                  });
                }
            ),
          ],
        ),*/      /// Container 방식
        child: ToggleButtons(
          color: Color(0xffE0E3E5),
          selectedColor: Colors.black,
          selectedBorderColor: Colors.black,
          fillColor: Colors.white,
          borderRadius: BorderRadius.circular(4.0.r),
          constraints: BoxConstraints(minHeight: 34.0,maxWidth: width),

          isSelected: _isSelected,
          onPressed: (index) {
            setState(() {
              //isSelected=List.all
              //isSelected[index]=true;
              for(int i = 0; i < _isSelected.length; i++) {
                if (i == index)
                  _isSelected[i] = true;
                else
                  _isSelected[i] = false;
              }
            });
          },
          children: [
            topButtonWidget(45.0.w, '전체', _isSelected[0]?Colors.black:Color(0xff737373)),
            topButtonWidget(40.0.w, '이벤트', _isSelected[1]?Colors.black:Color(0xff737373)),
            topButtonWidget(35.0.w, '상장목록', _isSelected[2]?Colors.black:Color(0xff737373)),
          ]
        )
      ),   /// top Button
      Container(
        //padding: EdgeInsets.only(left: 16.0.w,right: 16.0.w),
        height: 60*6,
        color: Colors.white,
        child: CarouselSlider.builder(
          //itemPositionsListener: _itemPositionsListener,
          options: CarouselOptions(
            height: 60*6,
            initialPage: 0,
            scrollDirection: Axis.horizontal,
            enableInfiniteScroll: false,
            viewportFraction: 1.0,
            //aspectRatio: 16/9,
            onPageChanged: (index, reason) {
              setState(() {
                _itemIndex = index;
              });
            },
          ),
          itemCount: sampleCryptoNews.length~/7+1,
          itemBuilder: (BuildContext context,int row,int realIndex){
            return Container(
              padding: EdgeInsets.only(left: 16.0.w,right: 16.0.w),
              width: width,
              height: 60*6,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: sampleCryptoNews.length-6*row,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int col) {
                  int key = sampleCryptoNews.keys.elementAt(col+6*row);
                  Map<String, Object> list = sampleCryptoNews[key];
                  //print(list);
                  return Container(
                    height: 60.0,
                    child: Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${list['title']}',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14.0.sp,
                            ),),
                          //SizedBox(height: 1.0,),
                          Text('${list['date']}',
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color(0xff737373),
                                fontSize: 12.0.sp
                            ),),
                          Container(
                            //padding:EdgeInsets.only(top:10.0),
                            height: 1,
                            width: width.w,
                            color: Color(0xffECEFF1),
                            margin: EdgeInsets.only(top:10.0),
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),  /// News List
      Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 16.0.w,right: 16.0.w,top: 18.0,bottom: 18.0),
        //width: width,
        height: 46.0,
        alignment: Alignment.center,
        child: oneIndicator(sampleCryptoNews.length~/7+1, _itemIndex),
      ),  /// Indicator
    ]);
  }
}
