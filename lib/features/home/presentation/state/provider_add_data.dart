import 'dart:async';

import 'package:flutter/material.dart';
import 'package:student_management/database/databasedesktop.dart';
import 'package:student_management/student%20model/student_model.dart';

class HomePageProvider extends ChangeNotifier {
  List<StudentModel> filterlist = studentmodellist;
  Timer? timer;
  TextEditingController searchcontroller = TextEditingController();

  onsearch(String val) {
    if (timer != null && timer!.isActive) timer!.cancel();
    timer = Timer(
      const Duration(seconds: 1),
      () {
        filterlist = studentmodellist.where(
          (element) {
            return element.name.toLowerCase().contains(val.toLowerCase());
          },
        ).toList();
        notifyListeners();
      },
    );
  }

  searchbarclosebutton() {
    searchcontroller.clear();
    filterlist = studentmodellist;
    notifyListeners();
  }
  addstudent(){
    filterlist=studentmodellist;
    notifyListeners();
  }
}
