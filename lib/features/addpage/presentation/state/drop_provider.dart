import 'package:flutter/material.dart';

class DropProvider extends ChangeNotifier{
  final List<String> standards = [
    '1st Standard',
    '2nd Standard',
    '3rd Standard',
    '4th Standard',
    '5th Standard',
    '6th Standard',
    '7th Standard',
    '8th Standard',
    '9th Standard',
    '10th Standard'
  ];
  String standard='1st Standard';

  setstandard(String? standard){
    if(standard=='no'){
      this.standard='1st Standard';
    }
   else if(standard!=null){
      this.standard=standard;
    }
  }

  onchanged(String? value){
    if(value!=null){
    standard=value;
    notifyListeners();
    }
  }
  onsubmit(){
    standard='1st Standard';
  }
}