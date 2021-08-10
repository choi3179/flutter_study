import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:pattern_formatter/numeric_formatter.dart';

class PriceTextField extends StatefulWidget{

  final String text;
  final int initial;

  PriceTextField(this.text,this.initial);

  @override
  _PriceTextState createState() => _PriceTextState(text,initial);

}

class _PriceTextState extends State<PriceTextField>{

  String text;
  int initial;

  _PriceTextState(this.text,this.initial);

  late TextEditingController _textEditingController;
  FocusNode _focusNode=FocusNode();

  @override
  void initState(){
    super.initState();
    _textEditingController=TextEditingController(text: '${won.format(initial)}');

  }

  var won = NumberFormat('###,###,###,###', 'en_US');

  @override
    Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
      width: 200.w,
      height: 34,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: 121.w,
            child: TextField(
              controller: _textEditingController,
              textAlign: TextAlign.start,
              textAlignVertical: TextAlignVertical.center,
              style: TextStyle(
                  fontSize: 12.5.sp, height: 1.0, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                labelText: '$text',
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelStyle: TextStyle(
                  fontSize: 13.0.sp,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Color(0xffE0E3E5)),
                    borderRadius: BorderRadius.all(Radius.circular(4.0))
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(width: 1.w, color: Color(0xffFFBC00)),
                    borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                focusColor: Color(0xffFFBC00)
              ),
              //focusNode: _focusNode,
              //initialValue: '0',
              /*onChanged: (text){
                setState(() {
                  _textEditingController.text=text;
                });
              },*/
              keyboardType: TextInputType.number,
              inputFormatters: [
                ThousandsFormatter(),
                LengthLimitingTextInputFormatter(14)
              ],
              cursorWidth: 1,
              cursorHeight: 14.0,
            ),
          ),

          Row(
            children: [
              InkWell(
                child: Container(
                  width: 34.w,
                  height: 34,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE0E3E5), width: 1.w),
                      /*border: Border(
                        top: BorderSide(color: Color(0xffE0E3E5), width: 1),
                        bottom: BorderSide(color: Color(0xffE0E3E5), width: 1),
                        right: BorderSide(color: Color(0xffE0E3E5), width: 0.5),
                        left: BorderSide(color: Color(0xffE0E3E5), width: 1),
                      ),*/
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(4.0),
                          bottomLeft: Radius.circular(4.0))
                  ),
                  child: Icon(
                    Icons.remove,
                    size: 16.0.w,
                    color: Color(0xff2376F1),
                  ),
                ),
                onTap: (){
                  setState(() {
                    //initial!=0?initial=initial-10:initial=0;
                    int temp=int.parse(_textEditingController.text.replaceAll(',', ''));
                    temp=temp-10;
                    _textEditingController.text='${won.format(temp)}';
                  });
                },
              ),
              InkWell(
                child: Container(
                  width: 34.w,
                  height: 34,
                  decoration: BoxDecoration(
                      border: Border.all(color: Color(0xffE0E3E5), width: 1.w),
                      /*border: Border(
                        top: BorderSide(color: Color(0xffE0E3E5), width: 1),
                        bottom: BorderSide(color: Color(0xffE0E3E5), width: 1),
                        right: BorderSide(color: Color(0xffE0E3E5), width: 1),
                        left: BorderSide(color: Color(0xffE0E3E5), width: 0.5),
                      ),*/
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(4.0),
                          bottomRight: Radius.circular(4.0))
                  ),
                  child: Icon(
                    Icons.add,
                    size: 16.0.w,
                    color: Color(0xffD8352C),
                  ),
                ),
                onTap: (){
                  setState(() {
                    int temp=int.parse(_textEditingController.text.replaceAll(',', ''));
                    temp=temp+10;
                    _textEditingController.text='${won.format(temp)}';
                  });
                },
              ),
            ],
          ),    /// +, - 버튼

        ],
      ),
    );
  }


}
