import 'package:flutter/material.dart';

class Dateofbirth extends ChangeNotifier{
  bool isdate=false;
  DateTime? time;


  onsumbimmision(){
    isdate=true;
    notifyListeners();
  }
 DateTime? onchanged(datetime){
    time=datetime;
    isdate=false;
    notifyListeners();
    return time;
  }

}