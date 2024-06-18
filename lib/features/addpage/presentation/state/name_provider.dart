import 'package:flutter/material.dart';

class NameProvider extends ChangeNotifier{
  TextEditingController name=TextEditingController();

  setname(String? txt){
    if(txt!=null){
      name.text=txt;
    }
  }
  onsubmit(){
    name.clear();
  }
}