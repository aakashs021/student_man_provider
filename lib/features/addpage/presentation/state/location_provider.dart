import 'package:flutter/material.dart';

class LocationProvider extends ChangeNotifier{
  TextEditingController location=TextEditingController();

  setlocation(String? txt){
    if(txt!=null){
      location.text=txt;
    }
  }
  onsubmit(){
    location.clear();
  }
}