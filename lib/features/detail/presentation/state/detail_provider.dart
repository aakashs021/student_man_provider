import 'package:flutter/material.dart';
import 'package:student_management/student%20model/student_model.dart';

class DetailProvider extends ChangeNotifier{
  StudentModel? sd;

  DetailProvider({ this.sd});

  // setsd(StudentModel? newsd){
  //   if(newsd!=null){
  //     sd=newsd;
  //   }
  // }

  onadd(StudentModel newsd){
    sd=newsd;
    notifyListeners();
  }
}