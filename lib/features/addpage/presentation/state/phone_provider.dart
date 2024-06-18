import 'package:flutter/material.dart';

class PhoneProvider extends ChangeNotifier{
  TextEditingController phone=TextEditingController();

  setphone(String? txt){
    if(txt!=null){
    phone.text=txt;
    }
  }
  onsubmit(){
    phone.clear();
  }
}