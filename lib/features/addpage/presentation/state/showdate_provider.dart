import 'package:flutter/material.dart';

class ShowdateProvider extends ChangeNotifier{
  DateTime? dateTime;
  bool ispicked=true;

  oninit(){
    dateTime=null;
  }

  onpicked(DateTime? value){
    if(value!=null){
      dateTime=value;
      ispicked=true;
      notifyListeners();
    }
  }
  ispickedornot(){
    ispicked=false;
    notifyListeners();
  }

  setdatetime(DateTime? date){
    if(date!=null){
      dateTime=date;
    }
  }

  onsubmit(){
    dateTime=null;
    ispicked=true;
  }
}