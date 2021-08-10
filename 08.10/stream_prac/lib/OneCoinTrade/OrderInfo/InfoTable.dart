
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Item {
  Item({
    required this.code,
    required this.orderPrice,
    required this.type,
    required this.orderAmount,
    required this.amount,
    required this.orderTime
  });

  bool selected=false;
  final String code;
  final double orderPrice;
  final String type;
  final double orderAmount;
  final double amount;
  final String orderTime;
}

class DataTableExample extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return DataTableExampleState();
  }
}

class DataTableExampleState extends State<DataTableExample> {

  List<Item> _items = [];
  int _sortColumnIndex = 0;
  bool _sortAscending = true;

  @override
  void initState() {
    super.initState();
    setState(() {
      _items = _generateItems();
    });
  }

  List<Item> _generateItems() {
    return [
      Item(code:'BTC/KRW',orderPrice:15533,type:'매도',orderAmount: 0.001620,amount: 0.00025,orderTime: '21.07.10\n22:32'),
      Item(code:'BTC/KRW',orderPrice:15533,type:'매도',orderAmount: 0.001620,amount: 0.00025,orderTime: '21.07.10\n22:32'),
      Item(code:'BTC/KRW',orderPrice:15533,type:'매도',orderAmount: 0.001620,amount: 0.00025,orderTime: '21.07.10\n22:32'),
    ];
  }

  void updateSort(int columnIndex, bool ascending) {
    setState(() {
      _sortColumnIndex = columnIndex;
      _sortAscending = ascending;
    });
  }

  bool _allSelected=false;
  List<DataColumn> _createColumns() {
    return [
      DataColumn(
          label: InkWell(
              child: Container(
                width: 28.w,
                height: 80,
                alignment: Alignment.center,
                child: _allSelected?Icon(Icons.check_circle,size: 18.0.w,color: Color(0xffFFBC00),)
                    :Icon(Icons.radio_button_unchecked_outlined, size: 20.0.w, color: Color(0xff737373),),
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            width: 1.w,
                            color: Color(0xffCCCCCC)
                        ),
                        top: BorderSide(
                            width: 1.w,
                            color: Color(0xffCCCCCC)
                        ),
                    )
                ),
              ),
              onTap :(){
                setState(() {
                  _allSelected=!_allSelected;
                });
                for(Item i in _items){
                  i.selected=_allSelected;
                }
              }
          )
      ),
      DataColumn(
        label: Container(
          width: 88.5.w,
          height: 60,
          alignment: Alignment.center,
          child: Text('종목',
          style: TextStyle(
            color: Color(0xff737373),
            fontSize: 13.0
          ),),
          decoration: BoxDecoration(
              border: Border(
                  right: BorderSide(
                      width: 1,
                      color: Color(0xffCCCCCC)
                  ),
                  top: BorderSide(
                      width: 1.w,
                      color: Color(0xffCCCCCC)
                  ),
              )
          ),
        ),
      ),
      DataColumn(
          label: Container(
            width: 88.5.w,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child:  Container(
                    width: 88.5,
                    //height: 80,
                    alignment: Alignment.center,
                    child: Text('주문가격',
                    style: TextStyle(
                      color: Color(0xff737373),
                      fontSize: 13.0.sp
                    ),),
                    decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                              width: 1.w,
                              color: Color(0xffCCCCCC)
                          ),
                          bottom: BorderSide(
                              width: 1.w,
                              color: Color(0xffCCCCCC)
                          ),
                          top: BorderSide(
                              width: 1.w,
                              color: Color(0xffCCCCCC)
                          ),
                        )
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child:  Container(
                    width: 88.5.w,
                    //height: 80,
                    alignment: Alignment.center,
                    child: Text('거래종류',
                    style: TextStyle(
                      color: Color(0xff737373),
                      fontSize: 13.0.sp
                    ),),
                    decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                              width: 1.w,
                              color: Color(0xffCCCCCC)
                          ),
                        )
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          )
      ),
      DataColumn(
          label: Container(
            width: 88.5.w,
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child:  Container(
                    width: 88.5.w,
                    //height: 80,
                    alignment: Alignment.center,
                    child: Text('주문수량',style: TextStyle(
                        color: Color(0xff737373),
                        fontSize: 13.0.sp
                    ),),
                    decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                              width: 1.w,
                              color: Color(0xffCCCCCC)
                          ),
                          bottom: BorderSide(
                              width: 1.w,
                              color: Color(0xffCCCCCC)
                          ),
                          top:  BorderSide(
                              width: 1.w,
                              color: Color(0xffCCCCCC)
                          ),
                        )
                    ),
                  ),
                  flex: 1,
                ),
                Expanded(
                  child:  Container(
                    width: 88.5.w,
                    //height: 80,
                    alignment: Alignment.center,
                    child: Text('체결/미체결',style: TextStyle(
                        color: Color(0xff737373),
                        fontSize: 13.0.sp
                    ),),
                    decoration: BoxDecoration(
                        border: Border(
                          right: BorderSide(
                              width: 1.w,
                              color: Color(0xffCCCCCC)
                          ),
                        )
                    ),
                  ),
                  flex: 1,
                ),
              ],
            ),
          )
      ),
      DataColumn(
        label: Container(
          width: 88.5.w,
          height: 80,
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(
                width: 1.w,
                color: Color(0xffCCCCCC)
              )
            )
          ),
          alignment: Alignment.center,
          child: Text('주문시간',style: TextStyle(
              color: Color(0xff737373),
              fontSize: 13.0.sp
          ),),
        ),
      ),
    ];
  }   /// Column

  DataRow _createRow(Item item) {
    return DataRow(
      selected: item.selected,
      onSelectChanged: (bool? selected) {
        if (selected != null) {
          item.selected = selected;

          setState(() {
            Iterator it=_items.iterator;
            Set<bool> tmp={true};
            while(it.moveNext()){
              tmp.add(it.current.selected);
            }
            if(_allSelected&&item.selected!=_allSelected){
              _allSelected=false;
            }else if(tmp.length==1){
              _allSelected=true;
            }
          });
        }
      },
      cells: [
        DataCell(
            Container(
              width: 28.w,
              height: 80,
              alignment: Alignment.center,
              child: item.selected?Icon(Icons.check_circle,size: 18.0.w,color: Color(0xffFFBC00),)
                  :Icon(Icons.radio_button_unchecked_outlined,size: 18.0.w,color: Color(0xff737373),),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 1.w,
                          color: Color(0xffCCCCCC)
                      )
                  )
              ),
            )
        ),
        DataCell(
            Container(
              width: 88.5.w,
              height: 80,
              alignment: Alignment.center,
              child: Text(item.code.toString()),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 1.w,
                          color: Color(0xffCCCCCC)
                      )
                  )
              ),
            )
        ),
        DataCell(
            Container(
              width: 88.5.w,
              height: 80,
              alignment: Alignment.center,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          width: 88.5.w,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Text(item.orderPrice.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 1.w,
                                      color: Color(0xffCCCCCC)
                                  )
                              )
                          ),
                        )
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          width: 88.5.w,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w),
                          child: Text(item.type.toString(),
                            style: TextStyle(
                              color: item.type.toString()=='매수'?Color(0xffD8352C):Color(0xff2376F1),
                              fontSize: 13.0.sp,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 1,
                          color: Color(0xffCCCCCC)
                      )
                  )
              ),
            )
        ),
        DataCell(
            Container(
              width: 88.5.w,
              height: 80,
              alignment: Alignment.center,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 1,
                        child: Container(
                          width: 88.5.w,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w,),
                          child: Text(item.orderAmount.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.w,
                              color: Color(0xffCCCCCC)
                            )
                          )
                        ),
                      )
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                          width: 88.5.w,
                          alignment: Alignment.centerRight,
                          padding: EdgeInsets.symmetric(horizontal: 8.0.w,),
                          child: Text(item.amount.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 13.0.sp,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                    ),
                  ],
                ),
              ),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          width: 1.w,
                          color: Color(0xffCCCCCC)
                      )
                  )
              ),
            )
        ),
        DataCell(
            Container(
              width: 88.5.w,
              height: 80,
              alignment: Alignment.center,
              child: Text(item.orderTime.toString(),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xff737373),
                fontSize: 13.0.sp
              ),),
            )
        ),
      ],
    );
  }   /// Row

  @override
  Widget build(BuildContext context) {
    return Container(
        //padding: EdgeInsets.symmetric(horizontal: 16.0),
        height: 300,
        width:382.w,
        alignment: Alignment.center,
        child: DataTable(
          sortColumnIndex: _sortColumnIndex,
          sortAscending: _sortAscending,
          columnSpacing: 0,
          dividerThickness: 1,
          onSelectAll: (bool? isSelected) {
            if (isSelected != null) {
              _items.forEach((item) {
                item.selected = isSelected;
              });

              setState(() {});
            }
          },
          dataRowHeight: 80,
          //dataTextStyle: const TextStyle(fontStyle: FontStyle.italic, color: Colors.black),
          headingRowHeight: 60,
          //headingTextStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          horizontalMargin: 0,
          showBottomBorder: true,
          showCheckboxColumn: false,
          columns: _createColumns(),
          rows: _items.map((item) => _createRow(item))
              .toList(),
        ),
      );
  }
}