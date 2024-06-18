import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImageProvider extends ChangeNotifier {
  String? image;

  Future<void> onpick() async {
    final ImagePicker picker = ImagePicker();
    XFile? imagefile = await picker.pickImage(source: ImageSource.gallery);
    image = imagefile?.path;
    notifyListeners();
  }

  void setimage(String? img) {
    if(img=='no'){
      image=null;
    }
    else if(img!=null){
    image = img;
    } 
  }

  onsubmit() {
    image = null;
  }
}
