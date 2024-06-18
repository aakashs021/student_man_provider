import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Addpageprovider extends ChangeNotifier {
  XFile? image;
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

  onpick() async {
    final ImagePicker picker = ImagePicker();
    image = await picker.pickImage(source: ImageSource.gallery);
    notifyListeners();
   
  }

  onsumbimmision() {}
}
