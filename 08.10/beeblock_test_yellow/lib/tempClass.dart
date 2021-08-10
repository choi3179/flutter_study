
import 'package:flutter/material.dart';

class ChangePriceField with ChangeNotifier{
  int _initial;

  ChangePriceField(this._initial);

  getInitial()=>_initial;
  setInitial(double initial)=>_initial=initial as int;

  void increment(int least){
    _initial+=least;
    notifyListeners();
  }

  void decrement(int least){
    _initial-=least;
    notifyListeners();
  }

  void percent10(){
    _initial=(_initial/100*10) as int;
    notifyListeners();
  }

  void percent25(){
    _initial=(_initial/100*25) as int;
    notifyListeners();
  }

  void percent50(){
    _initial=(_initial/100*50) as int;
    notifyListeners();
  }

  void percent100(){
    _initial=(_initial/100*100) as int;
    notifyListeners();
  }
}

class OrderList{

  OrderList(this.selected,this.code,this.orderPrice,this.type,this.orderAmount,this.amount,this.orderTime);

  final bool selected;
  final String code;
  final double orderPrice;
  final String type;
  final double orderAmount;
  final double amount;
  final String orderTime;
}
