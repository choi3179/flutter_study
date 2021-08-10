import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:stream_prac/Data/news/beeblocknews.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stream_prac/MainPage/BeeBlockNews/topButton.dart';
import 'package:stream_prac/MainPage/MenuGrid/indicator.dart';
import 'package:stream_prac/serviceio/unitsvctest.dart';

class beeblockNewsWidget extends StatefulWidget {
  @override
  _beeblockState createState() => _beeblockState();
}

class _beeblockState extends State<beeblockNewsWidget> {
  int _itemIndex = 0;
  var temp;
  final List<bool> _isSelected = [true, false, false, false, false];
  var url='https://zzzzzhahatestserver.beeblock.co.kr/api/tb_content/dashboard?category=BN&lang=ko&ver=1628148562692';


  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final double height = MediaQuery.of(context).size.height;

    if(_isSelected[0]){
      url='https://zzzzzhahatestserver.beeblock.co.kr/api/tb_content/list?category=BN&subCategory=BN_E&page=0&size=47&lang=ko&ver=1628152725762';
    }else if(_isSelected[1])
      url='https://zzzzzhahatestserver.beeblock.co.kr/api/tb_content/list?category=BN&subCategory=BN_E&page=0&size=47&lang=ko&ver=1628152725762';

    return FutureBuilder(
        future: httpTest(url),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          /*if (_isSelected[0])
            temp = snapshot.data['BN_E'];
          else if (_isSelected[1])
            temp = snapshot.data['BN_E'];
          else if (_isSelected[2])
            temp = snapshot.data['BN_BN'];
          else if (_isSelected[3])
            temp = snapshot.data['BN_HB'];
          else
            temp = snapshot.data['SJ_KR'];*/
          return Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            SizedBox(
              height: 8,
            ),
            Container(
                width: width,
                height: 50,
                color: Colors.white,
                padding: EdgeInsets.only(
                    left: 16.0, right: 16.0, top: 10.0, bottom: 14.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  '비블록 소식',
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18.sp),
                )),
            Container(
              padding: EdgeInsets.only(
                left: 16.0,
                right: 16.0,
              ),
              width: width,
              height: 34,
              alignment: Alignment.center,
              color: Colors.white,
              child: ToggleButtons(
                color: Color(0xffE0E3E5),
                selectedColor: Colors.black,
                selectedBorderColor: Colors.black,
                fillColor: Colors.white,
                //splashColor: Color(0xFF6200EE).withOpacity(0.12),
                //hoverColor: Color(0xFF6200EE).withOpacity(0.04),
                borderRadius: BorderRadius.circular(4.0.r),
                constraints: BoxConstraints(minHeight: 34.0, maxWidth: width),

                isSelected: _isSelected,
                onPressed: (index) {
                  setState(() {
                    //isSelected=List.all
                    //isSelected[index]=true;
                    for (int i = 0; i < _isSelected.length; i++) {
                      if (i == index)
                        _isSelected[i] = true;
                      else
                        _isSelected[i] = false;
                    }
                    if (_isSelected[0])
                      temp = snapshot.data['BN_E'];
                    else if (_isSelected[1])
                      temp = snapshot.data['BN_E'];
                    else if (_isSelected[2])
                      temp = snapshot.data['BN_BN'];
                    else if (_isSelected[3])
                      temp = snapshot.data['BN_HB'];
                    else
                      temp = snapshot.data['SJ_KR'];
                  });
                },

                children: [
                  topButtonWidget(20.0.w, '전체',
                      _isSelected[0] ? Colors.black : Color(0xff737373)),
                  topButtonWidget(15.0.w, '이벤트',
                      _isSelected[1] ? Colors.black : Color(0xff737373)),
                  topButtonWidget(10.0.w, '공지사항',
                      _isSelected[2] ? Colors.black : Color(0xff737373)),
                  topButtonWidget(10.0.w, '홍보센터',
                      _isSelected[3] ? Colors.black : Color(0xff737373)),
                  topButtonWidget(10.0.w, '상장목록',
                      _isSelected[4] ? Colors.black : Color(0xff737373)),
                ],
              ),
            ),
            Container(
              //padding: EdgeInsets.only(left: 16.0.w,right: 16.0.w),
              height: 60 * 6,
              color: Colors.white,
              child: CarouselSlider.builder(
                //itemPositionsListener: _itemPositionsListener,
                options: CarouselOptions(
                  height: 60 * 6,
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
                itemCount: snapshot.data['content'].length~/7+1,//int.parse(temp['count']) ~/ 7 + 1,
                //sampleBeeBlockNews.length ~/ 7 + 1,
                itemBuilder: (BuildContext context, int row, int realIndex) {
                  //print(int.parse(temp['count']) ~/ 7 + 1);
                  return Container(
                    padding: EdgeInsets.only(left: 16.0, right: 16.0),
                    width: width,
                    height: 60 * 6,
                    child: ListView.builder(
                      scrollDirection: Axis.vertical,
                      itemCount: snapshot.data['content'].length - 6 * row,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int col) {
                        Map<String, Object> list = snapshot.data['content'][col+6*(row)];
                        //print(list);
                        return Container(
                          height: 60.0,
                          child: Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${list['title']}',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14.0.sp,
                                  ),
                                ),
                                //SizedBox(height: 1.0,),
                                Text(
                                  '${list['date']}',
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Color(0xff737373),
                                      fontSize: 12.0.sp),
                                ),
                                Container(
                                  //padding:EdgeInsets.only(top:10.0),
                                  height: 1,
                                  width: width,
                                  color: Color(0xffECEFF1),
                                  margin: EdgeInsets.only(top: 10.0),
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
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.only(
                  left: 16.0.w, right: 16.0.w, top: 18.0, bottom: 18.0),
              //width: width,
              height: 46.0,
              alignment: Alignment.center,
              child:
                  oneIndicator(snapshot.data['content'].length ~/ 7 + 1, _itemIndex),
            ),
          ]);
        });
  }
}
