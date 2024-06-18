import 'package:flutter/material.dart';

class RadioProvider extends ChangeNotifier{
  String gender='Male';

  setgender(String? gender){
    if(gender!=null){
      this. gender=gender;
    }
  }
  onchanged(String? value){
    gender=value!;
    notifyListeners();
  }
  onsubmit(){
    gender='Male';
  }
}